const path = require('path');
const HtmlWebPackPlugin = require("html-webpack-plugin");

var config = {
		mode : "none",
		module : {
			rules : [ {
				test : /\.(js|jsx)$/,
				exclude : "/node_modules",
				use : [ 'babel-loader' ],
			} ]
		}
};

var indexCarConfig = Object.assign({}, config, {
	entry : {
		alarm : './src/IndexCarLists.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/'),
		filename : 'IndexCarLists.js'
	},

});
var domesticCarConfig = Object.assign({}, config, {
	entry : {
		alarm : './src/DomesticCarLists.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/'),
		filename : 'DomesticCarLists.js'
	},

});
var importCarConfig = Object.assign({}, config, {
	entry : {
		alarm : './src/ImportCarLists.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/'),
		filename : 'ImportCarLists.js'
	},

});
var alarmConfig = Object.assign({}, config, {
	entry : {
		alarm : './src/alarm/AlarmList.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/alarm/'),
		filename : 'AlarmList.js'
	},

});
var introConfig = Object.assign({}, config, {
	entry : {
		intro : './src/intro/FacilityListMain.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/intro/'),
		filename : 'FacilityListMain.js'
	},
});
var magazineConfig = Object.assign({}, config, {
	entry : {
		magazine : './src/magazine/MagazineMain.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/magazine/'),
		filename : 'MagazineMain.js'
	},
});
var csActualCarConfig = Object.assign({}, config, {
	entry : {
		safety : './src/cs/ActualCarList.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/cs/'),
		filename : 'ActualCarList.js'
	},
});
var csDealerListConfig = Object.assign({}, config, {
	entry : {
		safety : './src/cs/DealerList.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/cs/'),
		filename : 'DealerList.js'
	},
});
var csCompanyListConfig = Object.assign({}, config, {
	entry : {
		safety : './src/cs/CompanyList.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/cs/'),
		filename : 'CompanyList.js'
	},
});
var mypageQaListConfig = Object.assign({}, config, {
	entry : {
		safety : './src/mypage/QaList.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/mypage/'),
		filename : 'QaList.js'
	},
});
var searchConfig = Object.assign({}, config, {
	entry : {
		search : './src/search/CarSearchMain.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/search/'),
		filename : 'CarSearchMain.js'
	},
});
var sellConfig = Object.assign({}, config, {
	entry : {
		search : './src/sell/SellList.jsx',
	},
	output : {
		path : path.resolve(__dirname, './build/sell/'),
		filename : 'SellList.js'
	},
});

// Return Array of Configurations
module.exports = [
	indexCarConfig, domesticCarConfig, importCarConfig, alarmConfig, introConfig, magazineConfig, csActualCarConfig, csDealerListConfig, csCompanyListConfig, mypageQaListConfig, searchConfig, sellConfig,
];

