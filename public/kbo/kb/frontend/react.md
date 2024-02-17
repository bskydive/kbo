# React

## собес

 * [Любимая задачка на знание React](https://habr.com/ru/companies/tensor/articles/779718/)
	```ts
		function useFetch(url) {
		const [data, setData] = useState(null);
		const [isLoading, setIsLoading] = useState(false);
		const [error, setError] = useState(null);

		useEffect(() => {
			// флаг отмены
			let cancelled = false;

			setIsLoading(true);
			setData(null);
			setError(null);
			fetch(url)
				.then((res) => res.json())
				.then((respData) => {
					if (!cancelled) setData(respData);
				})
				.catch((e) => {
					if (!cancelled) setError(e);
				})
				.finally(() => {
					if (!cancelled) setIsLoading(false);
				});

			return () => {
				// выставим признак того, что запрос отменен
				cancelled = true;
			};
		}, [url]);

		return [data, isLoading, error];
		}

	```
