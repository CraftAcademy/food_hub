function timesFunction(callback) {
    if (typeof callback !== "function") {
        throw new TypeError("Callback is not a function");
    } else if (isNaN(parseInt(Number(this.valueOf())))) {
        throw new TypeError("Object is not a valid number");
    }
    for (let i = 0; i < Number(this.valueOf()); i++) {
        callback(i);
    }
};

String.prototype.times = timesFunction;
Number.prototype.times = timesFunction;