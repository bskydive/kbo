# Как подготовиться и пройти System Design Interview


## [Как подготовиться и пройти System Design Interview. Александр Поломодов](https://www.youtube.com/watch?v=jUbOm0B-eKQ)

### подготовка

 * планировать и следить за графиком интервью
 * следить за приоритетами снаружи - сначала прояснить и поторговаться, потом проектировать
 * следить за приоритетами внутри - сначала обсуждать более важные части
 * оговаривать, если не знаком с какими-то технологиями

* ботанство
	* architecture tradeoff analysis method
	* Вигерс software requirements 3rd ed
	* software architecture for busy developers
	* tannenbaum - computer networks
	* hohpe - enterprise integration patterns
	* stateless принципы - the twelve-factor app
	* software architecture: the hard parts
	* k8s patterns
	* system context diagram - c4model.com
	* container diagram - c4model.com
	* sequence/activity diagram - UML
	* idef0
	* BPMN
	* kleppmann designing data-intensive applications
	* сертификация RDBMS, noSQL, k8s, ELK
	* technology benchmarks
	* SRE - building secure and reliable systems
	* book - database internals
	* book - distributed systems
	* t.me/book_cube/629

### структура

 * контекст системы
 * требования
	* функциональные
	* нефункциональные
	* usability
	* auditability
	* maintainability
	* security
	* low latency
	* high throughput
	* i18n
	* high availability
	* sizing
 * формализация требований
	* пользовательские истории
	* торг уместен
	* часть функционала можно реализовать за счёт смежных систем
	* часть функционала можно отложить по времени реализации
	* ранжирование требований
 * границы системы
	* сценарии тестирования
	* api
	* files
	* DB
	* messaging
	* DDD
 * потоки данных
	* основной поток работы happy path
	* аварийные потоки exceptional flows
	* оптимизация read/write path tradeoffs
	* модели, структуры данных
	* in-memory
	* persistent
	* stateful/stateless
 * компоненты системы
	* исключительные случаи, отказ компонентов
 * масштабирование
	* горизонтальное
	* вертикальное
	* stateless
	* stateful
		* read - replication, consistency degradation
		* write - partitioning, sharding, ограничения схемы потоков данных
 * выход
	* user story
	* концептуальная схема
		* ER diagram
		* class diagram
	* реальная схема
		* технологии
		* концепции failure domains
		* эксплуатация
			* day-2 operations
			* log
			* mon
			* migration
			* backup

### выбор конкретных технологий
	* критерии выбора технологии
		* гарантии
		* диапазон применимости
		* ограничения
		* DB
			* https://benchant.com/ranking/database-ranking
			* https://github.com/benstopford/awesome-db-benchmarks
			* https://db-engines.com/en/ranking
			* https://jepsen.io/analyses
	* сети, ограничения протоколов
		* osi
		* udp
		* tcp/ip
		* dns
		* http 1/2/3
		* websocket
 	* разные диалекты api контрактов
		* rest
		* rpc
		* graphql
		* asyncApi
	* балансировка
		* nginx
		* haproxy
	* оркестрация
		* k8s, kubernetes
	* stateful
		* DBMS
			* rdbms
			* nosql
				* k/v
				* document oriented
				* column oriented
				* graph


## 

