#ifndef INCLUDE_CCAPI_CPP_CCAPI_MARKET_DATA_SERVICE_BINANCE_FUTURES_H_
#define INCLUDE_CCAPI_CPP_CCAPI_MARKET_DATA_SERVICE_BINANCE_FUTURES_H_
#include "ccapi_cpp/ccapi_enable_exchange.h"
#ifdef ENABLE_BINANCE_FUTURES
#include "ccapi_cpp/ccapi_market_data_service_binance_base.h"
namespace ccapi {
class MarketDataServiceBinanceFutures final : public MarketDataServiceBinanceBase {
 public:
  MarketDataServiceBinanceFutures(SubscriptionList subscriptionList, std::function<void(Event& event)> wsEventHandler, SessionOptions sessionOptions, SessionConfigs sessionConfigs, std::shared_ptr<ServiceContext> serviceContextPtr): MarketDataServiceBinanceBase(subscriptionList, wsEventHandler, sessionOptions, sessionConfigs, serviceContextPtr) {
    this->name = CCAPI_EXCHANGE_NAME_BINANCE_FUTURES;
    this->baseUrl = sessionConfigs.getUrlWebsocketBase().at(this->name);
    this->isFutures = true;
  }
};
} /* namespace ccapi */
#endif
#endif  // INCLUDE_CCAPI_CPP_CCAPI_MARKET_DATA_SERVICE_BINANCE_FUTURES_H_
