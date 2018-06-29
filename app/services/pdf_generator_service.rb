class PdfGeneratorService

  def initialize(collection)
    @collection = collection
    message = 'There\'s nothing to put in your book. Please add some recipes first'
    raise StandardError.new(message) if @collection.recipes.empty?
  end

  def generate_pdf
    date = DateTime.now.strftime('Date%Y%m%dTime%H%M')
    filename = [@collection.user.email.split('@').first, date].join('-') + '.pdf'

    pdf = create_and_configure_pdf

    front_page(pdf)

    @collection.recipes.each do |recipe|
      pdf.start_new_page
      insert_image(pdf, recipe) if recipe.image.attached?
      pdf.text recipe.title, size: 20, style: :bold, align: :center
      pdf.move_down 5
      pdf.text "Posted by: #{recipe.user.full_name}", size: 10, align: :center
      pdf.move_down 10
      pdf.text recipe.description
      pdf.move_down 10
      pdf.text 'Ingredients:', style: :bold
      pdf.text recipe.ingredients
      pdf.move_down 10
      pdf.text 'Directions:', style: :bold
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
    pdf.font_size 15

    pdf
  end

  def front_page(pdf)
    logo = "#{Rails.root}/app/assets/images/foodhublogo.png"
    pdf.move_down 100
    pdf.image logo, position: :center, width: 450, height: 150
    pdf.move_down 100
    pdf.text 'My Recipe Book', size: 48, align: :center
    pdf.move_down 150
    pdf.text "by: #{ @collection.user.full_name}", size: 25, align: :right
    pdf.move_down 10
    pdf.text 'With Recipes from FoodHub', size: 18, align: :right
  end

  def add_attachment(filename)
    @collection.pdf.attach(io: File.open(Rails.root.join(filename)), filename: filename)
  end

  def insert_image(pdf, recipe)
    pdf.image open(recipe.image.service_url), width: 300, height: 250, position: :center
    pdf.move_down 15
  end

end
