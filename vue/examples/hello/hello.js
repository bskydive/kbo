/**
 * v-for with template
 * scope visibility
 * script x-template
 * array manipulation
 * autostart
 */
Vue.component(
		'list-item-component',
		{
			template: '#id-list-item-template',
			props: ['item']
		}
);

let app = new Vue({
	el: '#app',
	data() {
		return {
			list: [
				{key: 'string', value: 'string'},
				{key: 'number', value: 123},
				{key: 'float', value: 123.123}
			],
			parsedList: [],
			computedList: [{key: 'empty', value: 'empty'}]
		};
	},
	computed: {
		safeComputedList: {
			get() {
				if (!(this.computedList instanceof Array)) {this.computedList = [{key: 'empty', value: 'empty'}];}
				return this.computedList;
			},
			set(array) {
				console.log('array', array);
				this.computedList = [];
				array.forEach(item => {
					this.computedList.push(item);
				});

			}
		}
	},
	created() {
		this.start();//autostart
	},
	methods: {
		start() {
			this.parseData();
			this.parseComputed(this.parsedList);
		},
		parseData() {//copy array from list to parsedList
			console.log('list', this.list);
			this.list.forEach(item => {
				this.parsedList.push(item);
			});
			console.log('list', this.list);
		},
		parseComputed() {//copy array from parsedList to computedList
			console.log('computedList', this.safeComputedList);
			this.safeComputedList = this.parsedList;
			console.log('computedList', this.safeComputedList);
		}
	}
});