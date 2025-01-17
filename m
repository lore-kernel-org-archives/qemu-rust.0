Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCY-0001VT-2t
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCW-0001UA-Ak
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCU-0002BB-SR
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaboZ+TQyEKNVXlrPQA7ag9T+Mayf0OWrnAczy+Hp9Q=;
 b=DsBl3NIx3D2MUzu+lpeDOxqFrPu/UzQSb3uxkh2wkSidwG2MMG2Nl23T3Wd93302cf9J0m
 6d5EVna1u4D/VyR7HWYq8tvd11gabAYTy08KNSm4SNLF11Ho25XUrJ2FOIPBozMKD+5CC3
 /OsDu4wWT4JCO5HbpSerHD+PtvrDdEU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-FGpWebavM3mcJ9C1Byggvw-1; Fri, 17 Jan 2025 14:40:11 -0500
X-MC-Unique: FGpWebavM3mcJ9C1Byggvw-1
X-Mimecast-MFC-AGG-ID: FGpWebavM3mcJ9C1Byggvw
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5d40c0c728aso2307590a12.2
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142810; x=1737747610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaboZ+TQyEKNVXlrPQA7ag9T+Mayf0OWrnAczy+Hp9Q=;
 b=Tn4peC9OGuHbAf+wTIvzjI0teA2X76hCdVsKq0tmHIP61UsGOf9zh/eduIitYwIs6K
 DuJ7OXxXoUHnOBw66aRnr7Xm6dV0+VNOZFfLFnSoyHt6gP2TWeMHveZZeeopTqoZmPg+
 NkSz65USAiOyB8pMiP1A+YRxyr3uWIXTqRrr/E/UdqrB4p6CpLiDQ7y9JFAvEgDVzcgh
 tjgtLWKb2CcT+Y3fmN7nnahWdz6C7gIlKW1QpDiW3BKWYpL3jwNaU4kh+lWt4Q6qP7Dl
 qNLGkju1X9nWWV9ZwxqazkCWov810OMfoz3RpMeFk5vl876nEmKC0Rwaz8oUkY+m3woT
 4FgA==
X-Gm-Message-State: AOJu0YwwJ3/3WacZotyHdDZrhXiMYTqVN3wNaBRW9Jb9mylQD7SKxc3x
 PAKjtpmYklQi7ZsKrcAyfFCcBVfcoEL3y+nagQyUF6VZ0CQmw9aoX0/idpF+qSgKjmBxWWNlI3q
 XPQi+7BSxS0K47MngNvrW2NeGCy87WDaICZKaMsUUVGNb+Bmzk6Q=
X-Gm-Gg: ASbGncsmy4hJYLXcGHk9/0c9M31OCRzxcK0hsAGu17Osdj9ojVsxONZUqp1TqJjnp9D
 68XtR/fhSWTq8sD4imIklEBQVfKfgONEj3HOliweXGWUhHnjUGhBmVy1V2dvtF5fVRra3gbkl/C
 P137wldoWTi5ah0wKHO2OGaMB6jtQ+PyOsgOSPSQuCCxQ98L6yz5e0AEExYhs0W3JpgXjZT+vFv
 HzZlQajSpp/tguQsaF5PLZ9dL+FHbZHSg315de3ibBi/GSacMZeXYAHKAA52w==
X-Received: by 2002:a05:6402:524b:b0:5d0:9054:b119 with SMTP id
 4fb4d7f45d1cf-5db7db07787mr8614996a12.21.1737142810008; 
 Fri, 17 Jan 2025 11:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDQN3/+dlRteAovEglF5VL6vxcKS7afffhvsgRaXODoQ26l5oelB3KyewP+DUvzPrRvfyxEA==
X-Received: by 2002:a05:6402:524b:b0:5d0:9054:b119 with SMTP id
 4fb4d7f45d1cf-5db7db07787mr8614735a12.21.1737142807492; 
 Fri, 17 Jan 2025 11:40:07 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73642247sm1949804a12.2.2025.01.17.11.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 01/10] rust: qemu-api: add sub-subclass to the integration
 tests
Date: Fri, 17 Jan 2025 20:39:54 +0100
Message-ID: <20250117194003.1173231-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c7Mp8ddcxkjp71yIn0qybcStbqIozSmw3GS7Rnn9nEg_1737142810
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.79,
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:16 -0000

From: Zhao Liu <zhao1.liu@intel.com>

missing signed-off-by from zhao
---
 rust/qemu-api/tests/tests.rs | 56 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 526c3f4f8ea..5c3e75ed3d5 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -14,8 +14,8 @@
     cell::{self, BqlCell},
     declare_properties, define_property,
     prelude::*,
-    qdev::{DeviceImpl, DeviceState, Property},
-    qom::{ObjectImpl, ParentField},
+    qdev::{DeviceClass, DeviceImpl, DeviceState, Property},
+    qom::{ClassInitImpl, ObjectImpl, ParentField},
     vmstate::VMStateDescription,
     zeroable::Zeroable,
 };
@@ -37,6 +37,10 @@ pub struct DummyState {
 
 qom_isa!(DummyState: Object, DeviceState);
 
+pub struct DummyClass {
+    parent_class: <DeviceState as ObjectType>::Class,
+}
+
 declare_properties! {
     DUMMY_PROPERTIES,
         define_property!(
@@ -49,7 +53,7 @@ pub struct DummyState {
 }
 
 unsafe impl ObjectType for DummyState {
-    type Class = <DeviceState as ObjectType>::Class;
+    type Class = DummyClass;
     const TYPE_NAME: &'static CStr = c_str!("dummy");
 }
 
@@ -67,6 +71,51 @@ fn vmsd() -> Option<&'static VMStateDescription> {
     }
 }
 
+// `impl<T> ClassInitImpl<DummyClass> for T` doesn't work since it violates
+// orphan rule.
+impl ClassInitImpl<DummyClass> for DummyState {
+    fn class_init(klass: &mut DummyClass) {
+        <Self as ClassInitImpl<DeviceClass>>::class_init(&mut klass.parent_class);
+    }
+}
+
+#[derive(qemu_api_macros::offsets)]
+#[repr(C)]
+#[derive(qemu_api_macros::Object)]
+pub struct DummyChildState {
+    parent: ParentField<DummyState>,
+}
+
+qom_isa!(DummyChildState: Object, DeviceState, DummyState);
+
+pub struct DummyChildClass {
+    parent_class: <DummyState as ObjectType>::Class,
+}
+
+unsafe impl ObjectType for DummyChildState {
+    type Class = DummyChildClass;
+    const TYPE_NAME: &'static CStr = c_str!("dummy_child");
+}
+
+impl ObjectImpl for DummyChildState {
+    type ParentType = DummyState;
+    const ABSTRACT: bool = false;
+}
+
+impl DeviceImpl for DummyChildState {}
+
+impl ClassInitImpl<DummyClass> for DummyChildState {
+    fn class_init(klass: &mut DummyClass) {
+        <Self as ClassInitImpl<DeviceClass>>::class_init(&mut klass.parent_class);
+    }
+}
+
+impl ClassInitImpl<DummyChildClass> for DummyChildState {
+    fn class_init(klass: &mut DummyChildClass) {
+        <Self as ClassInitImpl<DummyClass>>::class_init(&mut klass.parent_class);
+    }
+}
+
 fn init_qom() {
     static ONCE: BqlCell<bool> = BqlCell::new(false);
 
@@ -85,6 +134,7 @@ fn test_object_new() {
     init_qom();
     unsafe {
         object_unref(object_new(DummyState::TYPE_NAME.as_ptr()).cast());
+        object_unref(object_new(DummyChildState::TYPE_NAME.as_ptr()).cast());
     }
 }
 
-- 
2.47.1


