/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

namespace java org.apache.zeppelin.interpreter.thrift


struct RemoteInterpreterContext {
  1: string paragraphId,
  2: string paragraphTitle,
  3: string paragraphText,
  4: string config,   // json serialized config
  5: string gui       // json serialized gui
}

struct RemoteInterpreterResult {
  1: string code,
  2: string type,
  3: string msg,
  4: string config,   // json serialized config
  5: string gui       // json serialized gui
}

service RemoteInterpreterService {
  void createInterpreter(1: string className, 2: map<string, string> properties);

  void open(1: string className);
  void close(1: string className);
  RemoteInterpreterResult interpret(1: string className, 2: string st, 3: RemoteInterpreterContext interpreterContext);
  void cancel(1: string className, 2: RemoteInterpreterContext interpreterContext);
  i32 getProgress(1: string className, 2: RemoteInterpreterContext interpreterContext);
  string getFormType(1: string className);
  list<string> completion(1: string className, 2: string buf, 3: i32 cursor);
  void shutdown();

  string getStatus(1:string jobId);
}