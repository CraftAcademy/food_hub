class PdfGeneratorService

  def initialize(collection)
    @collection = collection
    raise StandardError.new('Collection is empty') if @collection.recipes.empty?
  end

  def generate_pdf
    date = DateTime.now.strftime('Date%Y%m%dTime%H%M')
    filename = [@collection.user.email.split('@').first, date].join('-') + '.pdf'

    pdf = create_and_configure_pdf

    @collection.recipes.each do |recipe|
      pdf.text recipe.title
      pdf.text recipe.user.email
      pdf.text recipe.description
      pdf.text recipe.ingredients
      pdf.text recipe.directions
    end

    pdf.render_file filename
    add_attachment(filename)
  end

  def create_and_configure_pdf
    pdf = Prawn::Document.new(page_size: 'A4')

    pdf.font_families.update('Futura' => {
        bold: Rails.root.join('app/assets/fonts/futura-medium-bt.ttf'),
        normal: Rails.root.join('app/assets/fonts/futura-light-bt.ttf'),
    })

    pdf.font 'Futura'
    pdf.font_size 10

    pdf
  end

  def add_attachment(filename)
    @collection.pdf.attach(io: File.open(Rails.root.join(filename)), filename: filename)
  end
end
