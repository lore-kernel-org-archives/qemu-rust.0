Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4536DCD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:57:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1L-00023v-BA; Tue, 26 May 2026 13:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1K-000234-E6
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1I-0007xw-Nu
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+AGiBNwzTm1U9cZQLheRtuzZRE/8QtBdPokO2fQmR6g=;
 b=dBfqctqgIyeck2dfDsVmGYlvH2XZ6X/L+i3J9FvZfvH871GsxROJH6OvCtrU9GTAqyAZVm
 1ttSQQ85GSv3MSZXM/gVhabutErlI+4osXrVisOXB0ISOUyQEYRCLYVU7fSln9GZZ2Zj1o
 EauP1EMiADUgz8RxJeB0fWsyZUu3Qek=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-duqbILxXNT67p2ilFhHxSQ-1; Tue, 26 May 2026 13:56:46 -0400
X-MC-Unique: duqbILxXNT67p2ilFhHxSQ-1
X-Mimecast-MFC-AGG-ID: duqbILxXNT67p2ilFhHxSQ_1779818206
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-44f65835b77so7833499f8f.2
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818205; x=1780423005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+AGiBNwzTm1U9cZQLheRtuzZRE/8QtBdPokO2fQmR6g=;
 b=U3xztQtbsXPXGbdAscG8E8ks/EO+3dYaX+Rl6i55EH4m97HIlVX70b2QkqDtY3k8bg
 ElH2XjpB5BqEWEFEQbfKTW/dQv6awoac2zRCd/ilSSE5dVRLz9VCpgnLTDYT7ZtNOzx8
 Bhqc8BE9+NV5VYX0idn2DAz65BCbRQGAon6UnRcB9MsoKAf4lJi3+0ftK+wmKGcLqDcT
 YOf9KKmKIIo7LX/16/O1idKWpAvBJ9oqSTM4uGTzVOb1wzayWYLSUuyn7sB0l1pVJp0U
 DMquC3+dPGfISHkd0RraQ+HxlrSEgfmGxvEXB0n4HqQofO00e3gDwrKTeF+KeQfUY7zd
 SEjA==
X-Gm-Message-State: AOJu0YyBcE5+IvhcPMzik9Z3nW68pxh7Xlgy98MlbNmDdlK5DN3XjMyv
 QZRT74ZBCCBXaQRCL9pQ+0uaJPsKasmFlU21pIwA3xMZuh4JHGYO0xvXhcUJhZvSgIf52W+10+X
 xolgVuhMNI5xjArTC3MkXEZpKh8NciKQw/1j3cihATtYdIH1mV8vnPdHRQ/DY39k=
X-Gm-Gg: Acq92OGVhJLpgb9wwaGK33bRnUCMnJ8TEDMeHoxuPf9awzasf6aS1MUEtYNX6+ZyUX7
 C4mtqZ519Fby5qfdAT1VSRYTKXeW6dlcnO2wn2TAZ2o4ztuN9IFlp/JZtwEPTan95anZRRWfagY
 Lz6HDy3q2O3PRk0o7wBrEMPL/Z//xW7Pgg4nT9g8u/mW0A/5i+hO8hP7ldufzU+JwZXmIuRAm07
 awxTXDXve1VJTik2RRCw2lglGpNWzaqASVccZ1gN8dodUdEEt6Ez9EiHTf9WlX+I0Bin6DSeU8p
 awWXRvoz5lzT+URkcUyayITfDAGifV6af/+0wPvCiIDcB2FRH+u7yYWCRKihta+i2PtDJAhDLVa
 ImnZqq4M0dEOlnwDVp83phvCfwRxT2y4z0gKekboLdrxXRikpRRtT1aIs8UN5Bs5uFa0ue2Yt4N
 k+Qh/Q2Xkxq7d4JiQKFZEuVrGNA0s=
X-Received: by 2002:a05:6000:4308:b0:449:a07a:9676 with SMTP id
 ffacd0b85a97d-45eb38c1a3fmr36810698f8f.29.1779818205539; 
 Tue, 26 May 2026 10:56:45 -0700 (PDT)
X-Received: by 2002:a05:6000:4308:b0:449:a07a:9676 with SMTP id
 ffacd0b85a97d-45eb38c1a3fmr36810655f8f.29.1779818205137; 
 Tue, 26 May 2026 10:56:45 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4903bsm34573469f8f.21.2026.05.26.10.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH v3 09/19] scripts/qapi: reject empty enums
Date: Tue, 26 May 2026 19:56:08 +0200
Message-ID: <20260526175618.227743-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A78Z_q4CqB19jlk9dqPCJaFLdmWWeb5UvjBiapiM8N4_1779818206
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Raise an error if an enum has no members.  Such enums cannot be populated with
a valid value.  Do not extend the same limitation to enum whose members are
all compiled out; they can still be used as optional members.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/schema.py                  | 4 ++++
 tests/qapi-schema/enum-empty.err        | 2 ++
 tests/qapi-schema/enum-empty.json       | 2 ++
 tests/qapi-schema/enum-empty.out        | 0
 tests/qapi-schema/qapi-schema-test.json | 3 ---
 tests/qapi-schema/qapi-schema-test.out  | 1 -
 tests/qapi-schema/union-empty.err       | 4 ++--
 7 files changed, 10 insertions(+), 6 deletions(-)
 create mode 100644 tests/qapi-schema/enum-empty.err
 create mode 100644 tests/qapi-schema/enum-empty.json
 create mode 100644 tests/qapi-schema/enum-empty.out

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 8d88b40de2e..78c2a25fc9a 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -428,6 +428,10 @@ def __init__(
 
     def check(self, schema: QAPISchema) -> None:
         super().check(schema)
+        if not self.members:
+            raise QAPISemError(
+                self.info,
+                "enum '%s' must have at least one value" % self.name)
         seen: Dict[str, QAPISchemaMember] = {}
         for m in self.members:
             m.check_clash(self.info, seen)
diff --git a/tests/qapi-schema/enum-empty.err b/tests/qapi-schema/enum-empty.err
new file mode 100644
index 00000000000..6070bf62cbd
--- /dev/null
+++ b/tests/qapi-schema/enum-empty.err
@@ -0,0 +1,2 @@
+enum-empty.json: In enum 'TestEmpty':
+enum-empty.json:2: enum 'TestEmpty' must have at least one value
diff --git a/tests/qapi-schema/enum-empty.json b/tests/qapi-schema/enum-empty.json
new file mode 100644
index 00000000000..3b3dfb2e3d8
--- /dev/null
+++ b/tests/qapi-schema/enum-empty.json
@@ -0,0 +1,2 @@
+# An enum must have at least one value
+{ 'enum': 'TestEmpty', 'data': [] }
diff --git a/tests/qapi-schema/enum-empty.out b/tests/qapi-schema/enum-empty.out
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 8ca977c49d2..195f1c4847b 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -23,9 +23,6 @@
   'data': { 'enum1': 'EnumOne',   # Intentional forward reference
             '*enum2': 'EnumOne', 'enum3': 'EnumOne', '*enum4': 'EnumOne' } }
 
-# An empty enum, although unusual, is currently acceptable
-{ 'enum': 'MyEnum', 'data': [ ] }
-
 # Likewise for an empty struct, including an empty base
 { 'struct': 'Empty1', 'data': { } }
 { 'struct': 'Empty2', 'base': 'Empty1', 'data': { } }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 4617eb4e98a..ddd8bf80d66 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -18,7 +18,6 @@ object NestedEnumsOne
     member enum2: EnumOne optional=True
     member enum3: EnumOne optional=False
     member enum4: EnumOne optional=True
-enum MyEnum
 object Empty1
 object Empty2
     base Empty1
diff --git a/tests/qapi-schema/union-empty.err b/tests/qapi-schema/union-empty.err
index d4284399621..c07dcf32a5a 100644
--- a/tests/qapi-schema/union-empty.err
+++ b/tests/qapi-schema/union-empty.err
@@ -1,2 +1,2 @@
-union-empty.json: In union 'Union':
-union-empty.json:4: union has no branches
+union-empty.json: In enum 'Empty':
+union-empty.json:2: enum 'Empty' must have at least one value
-- 
2.54.0


