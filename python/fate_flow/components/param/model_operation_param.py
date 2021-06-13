#
#  Copyright 2019 The FATE Authors. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#


class ModelStoreParam:
    def __init__(self, model_id: str = None, model_version: str = None, store_address: dict = None, force_update: bool = False):
        self.model_id = model_id
        self.model_version = model_version
        self.store_address = store_address
        self.force_update = force_update

    def check(self):
        return True


class ModelRestoreParam:
    def __init__(self, model_id: str = None, model_version: str = None, store_address: dict = None):
        self.model_id = model_id
        self.model_version = model_version
        self.store_address = store_address

    def check(self):
        return True

