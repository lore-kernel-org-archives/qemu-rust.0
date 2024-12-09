Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1V-00041F-Oq
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1O-0003vL-8p
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1K-0007RN-67
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KnA6nxj6wRieH/eonLUIy1D83UK4FyVWaqyO6ZnPKE=;
 b=KytvSaHxJN/O4XtNWbOAKf1eAF01lYbz4LvdJ9PLi4Ff+9lNl7HVZ0njyRvSz+/L+mHfEy
 bKXmKWpKWnGdivMlWyuJbOws0LYm/bfkqjnI9oRjAK9U7n1VQtRS9C3MYkYgSg+Kqxo4NR
 IQzzugtrrYF9BqvjCt5MzoTe3eapWB8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-n04NONeYM06BoNWnQljr4Q-1; Mon, 09 Dec 2024 07:37:45 -0500
X-MC-Unique: n04NONeYM06BoNWnQljr4Q-1
X-Mimecast-MFC-AGG-ID: n04NONeYM06BoNWnQljr4Q
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434f1d39147so8931475e9.0
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747864; x=1734352664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KnA6nxj6wRieH/eonLUIy1D83UK4FyVWaqyO6ZnPKE=;
 b=jw1S0UhVM46thEvRTshsH1Iw984Rhq9GScD3aVikmG6CRUrmgRXOuAGiHjMG6xCfaK
 Sb017QC2irPgeYVsu4iEcIGLxjAiNnTbbiF9JRSuBuD8a0b1fynqnXCETX80IIW7Ulm4
 V5Hn92U7QevYG1Mg13LaI4se5+kicnx7a/6kGG77UKrQd9u40DO3Mq99hzw//Zhl3wBA
 sq9LYLXa3nBzB9Ak9NoS+IZuJFDk8PuhJXvUm9/2/Sj2G4gjH8CbGzeFJ7Mh5KwUw6ve
 mOQlLD5R1abqlJUGWr7j/NpVFg0QlXGBnS3k2uGXR01f0UXeDd4ET0Uv5dx5FgnxPjKL
 bxsw==
X-Gm-Message-State: AOJu0Yz5Nu38FT8Dq/Br8gWzrl8+dxP0o8AlN8+eW5Jj43kygerX6O25
 YJ+0gJDaJmrb4yrL6tpvhgjs/aGsRqKzQ1ilZ6JnU01X/sY+uzYxOnrCwLoYPTtmYLvYLAExKf5
 5QxlhEQ+m5RX+YZ+imKczFWbzazstRLyyWIMe35OGxfi2UmM5RwU=
X-Gm-Gg: ASbGnctkKdm5htMzzVYAXhiHp6zP7N9w9lrvjmTLV7n46SXTwqReD1AP0SL4TrIx+wL
 1gCVmypodU8UYTZPZ8Q36ogisrOBuuqJfaAT4nnSmhW4qbYZ1rl2MZKE/rqHIoTyr6NIJUuM3yc
 GtMWYf3nSGbaWEiI+dFL6diElEgpNGXibM0m7PIyTomoNGJSxyHAkQBz7qfU3OTwn5tnjJd0M/H
 WFGbRvmMbA9Lv4D0+9Z577GgK/gt6zKW9tJ8x2Wn5hHktITBHewfA==
X-Received: by 2002:a05:600c:4447:b0:431:5863:4240 with SMTP id
 5b1f17b1804b1-434fffa2a31mr2416445e9.24.1733747862506; 
 Mon, 09 Dec 2024 04:37:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEAVQBoTp9SPcNz6rRg1uImK74hwNwwXWayI3C2hJkGn6J5hBPTMiDx3R2ecMnTcnDOHcz/g==
X-Received: by 2002:a05:600c:4447:b0:431:5863:4240 with SMTP id
 5b1f17b1804b1-434fffa2a31mr2416285e9.24.1733747862149; 
 Mon, 09 Dec 2024 04:37:42 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f7160599sm43836515e9.23.2024.12.09.04.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 09/26] rust: qom: convert type_info! macro to an associated
 const
Date: Mon,  9 Dec 2024 13:37:00 +0100
Message-ID: <20241209123717.99077-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GLS0rwUBIL5cBmfI6JoS9WlTpnoL50mmkLxIqOula28_1733747864
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:54 -0000

type_info! is only used in the definition of ObjectImpl::TYPE_INFO, and
in fact in all of them.  Pull type_info!'s definition into the ObjectImpl
trait, thus simplifying the external interface of qemu_api::definitions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  6 ++--
 rust/qemu-api/src/definitions.rs | 50 ++++++++++++++------------------
 rust/qemu-api/tests/tests.rs     |  1 -
 3 files changed, 24 insertions(+), 33 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index bd12067aaf0..bcb146c24d6 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -106,7 +106,6 @@ pub struct PL011State {
 
 impl ObjectImpl for PL011State {
     type Class = PL011Class;
-    const TYPE_INFO: qemu_api::bindings::TypeInfo = qemu_api::type_info! { Self };
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011;
     const PARENT_TYPE_NAME: Option<&'static CStr> = Some(TYPE_SYS_BUS_DEVICE);
     const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_init);
@@ -149,7 +148,7 @@ unsafe fn init(&mut self) {
                 addr_of_mut!(*self).cast::<Object>(),
                 &PL011_OPS,
                 addr_of_mut!(*self).cast::<c_void>(),
-                Self::TYPE_INFO.name,
+                Self::TYPE_NAME.as_ptr(),
                 0x1000,
             );
             sysbus_init_mmio(sbd, addr_of_mut!(self.iomem));
@@ -598,7 +597,7 @@ pub fn post_load(&mut self, _version_id: u32) -> Result<(), ()> {
     chr: *mut Chardev,
 ) -> *mut DeviceState {
     unsafe {
-        let dev: *mut DeviceState = qdev_new(PL011State::TYPE_INFO.name);
+        let dev: *mut DeviceState = qdev_new(PL011State::TYPE_NAME.as_ptr());
         let sysbus: *mut SysBusDevice = dev.cast::<SysBusDevice>();
 
         qdev_prop_set_chr(dev, c_str!("chardev").as_ptr(), chr);
@@ -660,7 +659,6 @@ impl qemu_api::definitions::ClassInitImpl for PL011LuminaryClass {
 
 impl ObjectImpl for PL011Luminary {
     type Class = PL011LuminaryClass;
-    const TYPE_INFO: qemu_api::bindings::TypeInfo = qemu_api::type_info! { Self };
     const TYPE_NAME: &'static CStr = crate::TYPE_PL011_LUMINARY;
     const PARENT_TYPE_NAME: Option<&'static CStr> = Some(crate::TYPE_PL011);
     const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_luminary_init);
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
index 3291f4242ce..6ecfaf51b09 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/definitions.rs
@@ -9,15 +9,34 @@
 use crate::bindings::{Object, ObjectClass, TypeInfo};
 
 /// Trait a type must implement to be registered with QEMU.
-pub trait ObjectImpl {
-    type Class;
-    const TYPE_INFO: TypeInfo;
+pub trait ObjectImpl: Sized {
+    type Class: ClassInitImpl;
     const TYPE_NAME: &'static CStr;
     const PARENT_TYPE_NAME: Option<&'static CStr>;
     const ABSTRACT: bool = false;
     const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
     const INSTANCE_POST_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
     const INSTANCE_FINALIZE: Option<unsafe extern "C" fn(obj: *mut Object)> = None;
+
+    const TYPE_INFO: TypeInfo = TypeInfo {
+        name: Self::TYPE_NAME.as_ptr(),
+        parent: if let Some(pname) = Self::PARENT_TYPE_NAME {
+            pname.as_ptr()
+        } else {
+            core::ptr::null_mut()
+        },
+        instance_size: core::mem::size_of::<Self>(),
+        instance_align: core::mem::align_of::<Self>(),
+        instance_init: Self::INSTANCE_INIT,
+        instance_post_init: Self::INSTANCE_POST_INIT,
+        instance_finalize: Self::INSTANCE_FINALIZE,
+        abstract_: Self::ABSTRACT,
+        class_size: core::mem::size_of::<Self::Class>(),
+        class_init: <Self::Class as ClassInitImpl>::CLASS_INIT,
+        class_base_init: <Self::Class as ClassInitImpl>::CLASS_BASE_INIT,
+        class_data: core::ptr::null_mut(),
+        interfaces: core::ptr::null_mut(),
+    };
 }
 
 /// Trait used to fill in a class struct.
@@ -83,28 +102,3 @@ extern "C" fn ctor_fn() {
         }
     };
 }
-
-#[macro_export]
-macro_rules! type_info {
-    ($t:ty) => {
-        $crate::bindings::TypeInfo {
-            name: <$t as $crate::definitions::ObjectImpl>::TYPE_NAME.as_ptr(),
-            parent: if let Some(pname) = <$t as $crate::definitions::ObjectImpl>::PARENT_TYPE_NAME {
-                pname.as_ptr()
-            } else {
-                ::core::ptr::null_mut()
-            },
-            instance_size: ::core::mem::size_of::<$t>(),
-            instance_align: ::core::mem::align_of::<$t>(),
-            instance_init: <$t as $crate::definitions::ObjectImpl>::INSTANCE_INIT,
-            instance_post_init: <$t as $crate::definitions::ObjectImpl>::INSTANCE_POST_INIT,
-            instance_finalize: <$t as $crate::definitions::ObjectImpl>::INSTANCE_FINALIZE,
-            abstract_: <$t as $crate::definitions::ObjectImpl>::ABSTRACT,
-            class_size:  ::core::mem::size_of::<<$t as $crate::definitions::ObjectImpl>::Class>(),
-            class_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::ClassInitImpl>::CLASS_INIT,
-            class_base_init: <<$t as $crate::definitions::ObjectImpl>::Class as $crate::definitions::ClassInitImpl>::CLASS_BASE_INIT,
-            class_data: ::core::ptr::null_mut(),
-            interfaces: ::core::ptr::null_mut(),
-        };
-    }
-}
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 704c63c846f..7f9df348b00 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -55,7 +55,6 @@ pub struct DummyClass {
 
     impl ObjectImpl for DummyState {
         type Class = DummyClass;
-        const TYPE_INFO: qemu_api::bindings::TypeInfo = qemu_api::type_info! { Self };
         const TYPE_NAME: &'static CStr = c_str!("dummy");
         const PARENT_TYPE_NAME: Option<&'static CStr> = Some(device_class::TYPE_DEVICE);
     }
-- 
2.47.1


