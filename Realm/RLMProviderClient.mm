////////////////////////////////////////////////////////////////////////////
//
// Copyright 2020 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////
#import "RLMProviderClient.h"
#import "RLMApp_Private.hpp"

@implementation RLMProviderClient

- (instancetype)initWithApp:(RLMApp *)app {
    self = [super init];
    if (self) {
        _app = app;
    }
    return self;
}

- (void)handleResponse:(Optional<realm::app::AppError>)error
            completion:(RLMOptionalErrorBlock)completion {
    if (error && error->error_code) {
        return completion([self.app AppErrorToNSError:*error]);
    }
    completion(nil);
}

@end