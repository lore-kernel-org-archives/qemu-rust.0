Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4556CAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:51:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9k-0001Z6-78; Mon, 29 Sep 2025 11:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G9B-000130-Ow
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8v-0000dN-5Y
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+cJ9QO2Q0sAQJS568/ENx7YFMeKJSiogImV/H5vK6k=;
 b=Qw83UGCzQ1jYd2Yi5ThbTZ985pJRWJg8swtjlKJaQRYFDrZgIP5DFTJtMNUyQZmg9D2Y09
 YfLI3c1oHdmgafq1byWXn96p01DOpAh+0IGIzeWbGohh33fC2UEuyMd/+LXLXHY9Dw1BDf
 Op6yESQXUU8CATkiFMIhOVJftlQFiME=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-ws9Vn2KiOZ-M5YQx7kaLNA-1; Mon, 29 Sep 2025 11:50:20 -0400
X-MC-Unique: ws9Vn2KiOZ-M5YQx7kaLNA-1
X-Mimecast-MFC-AGG-ID: ws9Vn2KiOZ-M5YQx7kaLNA_1759161020
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-62fd7f9857cso3744570a12.0
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161019; x=1759765819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+cJ9QO2Q0sAQJS568/ENx7YFMeKJSiogImV/H5vK6k=;
 b=ZeoDmPX0HBNuCtzMJd/LM/37qAxMjEsIWdn7skabOcCZseGGPptuvcDJwjQtXg7NBt
 umHKLYpg5AEmZjcm4W+2BPTpupr9pYAaNqeqw3B9IqnvTpVaCBz/FceiwlXBQxAQokjT
 cIZd8uh2fk9XpYOkjwtqew8YqHgb9p7KfOwjtNjFeSEad7CHhLihFA00GYzqhHQNZnff
 /mNbW7rDLB4ykOsASg66YauWArr1FwKDBY8dKBdc+s/rT80GrOUMK1/ptJLDkJgrICCu
 2XL0xbm/D1wsmsMMhE18oj6XWx7kqA1Lm207a7mLKECaLNH1VjiO1vBLr1iglZ763l8e
 HGNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmUtxRcJGtZr/JwPQlVj/nyZX7fRbMDOmLr5nTOpb3UAEAR59YW/SpYizq9qKs5l0+NReaZvFbpPY=@nongnu.org
X-Gm-Message-State: AOJu0YwtA4LFD6tI5dcoj+wCg0X80100LtF3EGw8HhZmSDz/7K4vXayc
 C7/uQdyagQ/c5ysHfNrJWcB/3UA8T9GqIED9WXDcFBvRiAtDryL1OXATOTTP1t7SI2BEMJ5tYs8
 HMFmCYEuE9O/VfNLauVL7GKhpvwwn+2E8gqycIRz3bRB24oTX1zQxI9Y=
X-Gm-Gg: ASbGncvQ6SYtDlTB4Iuemvmf0F47vGSzpKPSKrtC8SxSIu1NVIn/LOQ8+ZeJ2SLBDMh
 MDicIfZKdsbRcbn/C9A7Zvh9oHnFmy+fwFd9utnWIUVn4CKBI52AeCopPB/pOQwaPTiOu4Big58
 i4DSojqnoaFMB62TybMy2QS6ZCo7bNiSL4SoPjrKS0gpysOkICzw4Qqtf58W8vqFdiPhadjllss
 MUH693+b5Jem7BrxlXqM1fa6VS3RPEJpipObesPU5vZUoLtMgaE+fT/2W5dcQ1ph/GNhvLgjhxi
 X5uH0xcktYiaEoi7wTwiUJB9dY3VLE5GZ+7OwZlB7/o8qGpwvSCW+8SbfZ2yFwm5Eq3x6S9MGp8
 rdbvF89mQkbr/1oNelkPOkYq8R2nF+thrWCdcgffmxphBZA==
X-Received: by 2002:a17:907:3e93:b0:b40:448d:cdb0 with SMTP id
 a640c23a62f3a-b40448df75dmr250786066b.41.1759161019538; 
 Mon, 29 Sep 2025 08:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsI8J36HzZ2hqMoZwqMNJrQRn4zL3+0oxOL7d8wPOdjwUDpKC0BmrdPUFkKf7RKZnQe8Ul1A==
X-Received: by 2002:a17:907:3e93:b0:b40:448d:cdb0 with SMTP id
 a640c23a62f3a-b40448df75dmr250783366b.41.1759161019124; 
 Mon, 29 Sep 2025 08:50:19 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f758csm953275566b.53.2025.09.29.08.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 15/16] tracetool/ftrace: add Rust support
Date: Mon, 29 Sep 2025 17:49:37 +0200
Message-ID: <20250929154938.594389-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5UfUEjmYhtJD-p8pZ4dTjsDfQr076_cB7ziWQVQgPkA_1759161020
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

From: Tanish Desai <tanishdesai37@gmail.com>

Signed-off-by: Tanish Desai <tanishdesai37@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/tracetool/backend/ftrace.py |  8 +++++-
 tests/tracetool/ftrace.rs           | 40 +++++++++++++++++++++++++++++
 tests/tracetool/tracetool-test.py   |  2 +-
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 tests/tracetool/ftrace.rs

diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index 7ddd5d11a66..e03698a2edf 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -12,7 +12,7 @@
 __email__      = "stefanha@redhat.com"
 
 
-from tracetool import out
+from tracetool import out, expand_format_string
 
 
 PUBLIC = True
@@ -43,3 +43,9 @@ def generate_h(event, group):
 def generate_h_backend_dstate(event, group):
     out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
         event_id="TRACE_" + event.name.upper())
+
+def generate_rs(event, group):
+    out('        let format_string = c"%(fmt)s";',
+        '        unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, %(args)s);}',
+        fmt=expand_format_string(event.fmt),
+        args=event.args.rust_call_varargs())
diff --git a/tests/tracetool/ftrace.rs b/tests/tracetool/ftrace.rs
new file mode 100644
index 00000000000..07b9259cf29
--- /dev/null
+++ b/tests/tracetool/ftrace.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// This file is @generated by tracetool, do not edit.
+
+#[allow(unused_imports)]
+use std::ffi::c_char;
+#[allow(unused_imports)]
+use util::bindings;
+
+#[inline(always)]
+fn trace_event_state_is_enabled(dstate: u16) -> bool {
+    (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
+}
+
+extern "C" {
+    static mut trace_events_enabled_count: u32;
+}
+extern "C" {
+    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+}
+
+#[inline(always)]
+#[allow(dead_code)]
+pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
+{
+    if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
+        let format_string = c"Blah context=%p filename=%s";
+        unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
+    }
+}
+
+#[inline(always)]
+#[allow(dead_code)]
+pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
+{
+    if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
+        let format_string = c"Wibble context=%p value=%d";
+        unsafe {bindings::ftrace_write(format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
+    }
+}
diff --git a/tests/tracetool/tracetool-test.py b/tests/tracetool/tracetool-test.py
index f58f3b795e7..3341fb18f90 100755
--- a/tests/tracetool/tracetool-test.py
+++ b/tests/tracetool/tracetool-test.py
@@ -14,7 +14,7 @@ def get_formats(backend):
         "c",
         "h",
     ]
-    if backend in {"log", "simple"}:
+    if backend in {"ftrace", "log", "simple"}:
         formats += ["rs"]
     if backend == "dtrace":
         formats += [
-- 
2.51.0


