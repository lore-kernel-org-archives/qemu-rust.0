Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd4M-000744-AT
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1k-00046Z-SO
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1j-0007YJ-28
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mka10JX4kza0QaAC8JzE3v6aWvEpjz7koPP+g4YXhzE=;
 b=Fusn+akSyAAFAxYB1nzNXYP1Vx9XfC+EYJyHLDYZO7PT9SZrlL9i7LBInaGZT0BRQ2dMaZ
 EUTTXMM5o6f930Mx1XjJV/e5c53OKZUZ+9wThadaFsl+ivrxAS26Mpx+nQXwGoyX8TkDml
 kUv8oQvSH0uUW1rIJI44i7PaedttyS8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-u08uUy4VNlKJvg4JZp-oqg-1; Mon, 09 Dec 2024 07:38:13 -0500
X-MC-Unique: u08uUy4VNlKJvg4JZp-oqg-1
X-Mimecast-MFC-AGG-ID: u08uUy4VNlKJvg4JZp-oqg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385df115288so1789098f8f.2
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747891; x=1734352691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mka10JX4kza0QaAC8JzE3v6aWvEpjz7koPP+g4YXhzE=;
 b=Oq/sy1Qeg6/x2h/KiWqHNhyoTtH4rW1NchodN9yjlg0L87ZtRls8Hz69f4iebj4C9S
 sfjm990b20UWPGkuVZj2zlzBF1ly6mN7iFaBSGOGTlU+JE/nNzde0baxg30yNbWdyzpa
 TvsGYzkqyesOjKZZOqo8o58EXdiEwKta30uER5kfZD7dD4bXqNlen/qzHNBUKSChaN01
 u/ZGKFKsXJVVadqE4z3mxndZawrUwKnB2GzTtX7sme8Vzh6HHWa/lRaa13/aY72TRLN7
 OysqWtNd1uZiK0lYdJsD3JKgU06qZwoxLh3d45YUvz0R6emREIe+fARODEzKWSnHUt83
 7ZKQ==
X-Gm-Message-State: AOJu0Yzfn74SWLzqJ9K3lKC7HuuoWKsrr5uwe0bQGDhEc3Ji7bB2KVkU
 koPa36zve7rNnnuCL+h57RdSVGQSXtHFRnjo7/zuaEVWdMtCG+iOHW/+zuJTZFbsI3IhUHvtHws
 oIt6Mp4PyVIyTLMAf1sYmQj/Ft8r+Z39pDlLilN3g7uvX7bucAVNLIG9KWJI=
X-Gm-Gg: ASbGncunuHpY+bRuU6NPY7XJTBkKm9eaCmwgBKFRic9rwF9HpbptRXMAJ5eC2+sH4/3
 MtnkixbOM+pwVb4JKi5oBGmjHRQqeFoZrAhlV7FYd0S/UtCF3rcrfrIZcq2HNHAgqOL+1zmXaU/
 XUYlqvgp/6JLbBjPeZFd0A018iUKltZlrf6axaFKSIQc1EslIJttuRcj+OrhOp3A++uvya6okr0
 SPwhjFpsz5Jscc1AeMHET7+c2Ti1vUbnM97/JvmzZctN9iDZyti2Q==
X-Received: by 2002:a5d:59a3:0:b0:386:4034:f9a0 with SMTP id
 ffacd0b85a97d-386453fbb7bmr127781f8f.52.1733747891630; 
 Mon, 09 Dec 2024 04:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOnitS1ndfRTSOAjmo4Aa07KZ1CsUCHy4hN4mqjX15w2pubCe4lwMeORYD14VyBTeSTiuEMg==
X-Received: by 2002:a5d:59a3:0:b0:386:4034:f9a0 with SMTP id
 ffacd0b85a97d-386453fbb7bmr127766f8f.52.1733747891207; 
 Mon, 09 Dec 2024 04:38:11 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3863157fb80sm8858577f8f.19.2024.12.09.04.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:38:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 21/26] rust: tests: allow writing more than one test
Date: Mon,  9 Dec 2024 13:37:12 +0100
Message-ID: <20241209123717.99077-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: indZdM2vR78FrpVHUIZb25bhrcGIRYLWlBpwduFu-Hs_1733747892
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Dec 2024 12:38:30 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/tests/tests.rs | 109 ++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 48 deletions(-)

diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 68557fb85c7..18738a80008 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -2,7 +2,7 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::ffi::CStr;
+use std::{cell::Cell, ffi::CStr, sync::Mutex};
 
 use qemu_api::{
     bindings::*,
@@ -14,55 +14,68 @@
     zeroable::Zeroable,
 };
 
+// Test that macros can compile.
+pub static VMSTATE: VMStateDescription = VMStateDescription {
+    name: c_str!("name").as_ptr(),
+    unmigratable: true,
+    ..Zeroable::ZERO
+};
+
+#[derive(qemu_api_macros::offsets)]
+#[repr(C)]
+#[derive(qemu_api_macros::Object)]
+pub struct DummyState {
+    parent: DeviceState,
+    migrate_clock: bool,
+}
+
+declare_properties! {
+    DUMMY_PROPERTIES,
+        define_property!(
+            c_str!("migrate-clk"),
+            DummyState,
+            migrate_clock,
+            unsafe { &qdev_prop_bool },
+            bool
+        ),
+}
+
+unsafe impl ObjectType for DummyState {
+    type Class = <DeviceState as ObjectType>::Class;
+    const TYPE_NAME: &'static CStr = c_str!("dummy");
+}
+
+impl ObjectImpl for DummyState {
+    type ParentType = DeviceState;
+    const ABSTRACT: bool = false;
+}
+
+impl DeviceImpl for DummyState {
+    fn properties() -> &'static [Property] {
+        &DUMMY_PROPERTIES
+    }
+    fn vmsd() -> Option<&'static VMStateDescription> {
+        Some(&VMSTATE)
+    }
+}
+
+fn init_qom() {
+    static ONCE: Mutex<Cell<bool>> = Mutex::new(Cell::new(false));
+
+    let g = ONCE.lock().unwrap();
+    if !g.get() {
+        unsafe {
+            module_call_init(module_init_type::MODULE_INIT_QOM);
+        }
+        g.set(true);
+    }
+}
+
 #[test]
-fn test_device_decl_macros() {
-    // Test that macros can compile.
-    pub static VMSTATE: VMStateDescription = VMStateDescription {
-        name: c_str!("name").as_ptr(),
-        unmigratable: true,
-        ..Zeroable::ZERO
-    };
-
-    #[derive(qemu_api_macros::offsets)]
-    #[repr(C)]
-    #[derive(qemu_api_macros::Object)]
-    pub struct DummyState {
-        pub _parent: DeviceState,
-        pub migrate_clock: bool,
-    }
-
-    declare_properties! {
-        DUMMY_PROPERTIES,
-            define_property!(
-                c_str!("migrate-clk"),
-                DummyState,
-                migrate_clock,
-                unsafe { &qdev_prop_bool },
-                bool
-            ),
-    }
-
-    unsafe impl ObjectType for DummyState {
-        type Class = <DeviceState as ObjectType>::Class;
-        const TYPE_NAME: &'static CStr = c_str!("dummy");
-    }
-
-    impl ObjectImpl for DummyState {
-        type ParentType = DeviceState;
-        const ABSTRACT: bool = false;
-    }
-
-    impl DeviceImpl for DummyState {
-        fn properties() -> &'static [Property] {
-            &DUMMY_PROPERTIES
-        }
-        fn vmsd() -> Option<&'static VMStateDescription> {
-            Some(&VMSTATE)
-        }
-    }
-
+/// Create and immediately drop an instance.
+fn test_object_new() {
+    init_qom();
     unsafe {
-        module_call_init(module_init_type::MODULE_INIT_QOM);
         object_unref(object_new(DummyState::TYPE_NAME.as_ptr()).cast());
     }
 }
-- 
2.47.1


