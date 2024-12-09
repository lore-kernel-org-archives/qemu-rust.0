Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd4A-0006Wc-Dy
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1k-00046S-9Y
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1g-0007Wj-IL
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AU4cR1A44Kzwr9V6X5ZqvFDrGfSGtRe4ER0j2E/bzHc=;
 b=bcqq/6KlyS1t3KmMYj1+SILrf8QIkJgMBZekjz3FhIT43EtJIT9L8iu4WLH4tC43TvEkjN
 zKJEAZSzvvk/PRpH6Z+uer9abrPV0QAkzmY7TuyI42v135pgl2TS9Hs19JOm15GTHF2tdM
 RL3TPrE4F+8VZyRjhpRikYNldDPAL8k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-cekqjW3KOSmWzx-aTq5dqA-1; Mon, 09 Dec 2024 07:38:07 -0500
X-MC-Unique: cekqjW3KOSmWzx-aTq5dqA-1
X-Mimecast-MFC-AGG-ID: cekqjW3KOSmWzx-aTq5dqA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434f4e9b73dso9914515e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747886; x=1734352686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AU4cR1A44Kzwr9V6X5ZqvFDrGfSGtRe4ER0j2E/bzHc=;
 b=fWsgoAB3vkNEXVmoAZvsKtg+iFyAhpqFj2jxuexoVL75/NZ1MM3yph8gaxPzFKHnjG
 P59IiLhwkblXDnc1mCZgmtSbkXo/UL6UCaKz+ww3Xsf0t7D0bdR/Ahwe1gKapySfZ+/b
 Wr3dh4Zp54PAfIMgSz0X1fj3/WRETCUsFfPKU8sea2NUK9+8kVfRb8dK9Q8fXMrOKWD+
 ndwbmVu1ReGrdMFiYJG8xMubL1E8jdsoZe7Yp23Dw/DX8RZqdOCaNAw1ghICvNxrGb1k
 6MsYePyLIdmL0E2iZO7vLmQ8oEiyk3tkns3Xhbmy/kXvgFvaDWGSTLsVo1669EB1xA0u
 ukdw==
X-Gm-Message-State: AOJu0YwbbYmHC7V6/pgWtkKQaRc2yIR8ur0ON05wi+/E0fQM2xTDbmW5
 JGlJy3UYudxjtgmCetGIS6e55sXrBfN82Sch7VpXNHZIF9qwYkSqq74KdNgcP7OiAgPzvUUGeuh
 K1Mf+BJOs0cu0jzCwTRXwo2OLhzXEW+BAUPt9q/lNIxzjL7yefH0kgeuc4VQ=
X-Gm-Gg: ASbGncshWbEDcb8izMj1Lb8UAsnFfgkiCK5q6Z2WajPEVB0aLfwh0CT6ZHzUpQRwhiB
 l5j5IVo5zX45CeT8e/BPZX13mvz1IxlPEdRCKD7gg/6pHbVd9GxTXFddNlxuv3Syd+2IVF0u/qe
 mcgB+NG/k+HqbyxW/u10rQpcGLANKW8zwIHoxjO2QmlU/qEpobNkLfyH9Ljn8sSsaQuAgGON4xr
 QBhjcyxQThsWyudQxiTFgftv1hY5GAXqcNFbQXLhSNQlpee9d8lbA==
X-Received: by 2002:a05:600c:1e12:b0:434:fd15:3adc with SMTP id
 5b1f17b1804b1-434fd153f18mr13116965e9.25.1733747886072; 
 Mon, 09 Dec 2024 04:38:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH792a2/w5pAGOwu2vIm8ipECAnESvUp2uFmPmy4nFPNNnT/IKjgVfrNZbB+CwJ2RXP4mmUZQ==
X-Received: by 2002:a05:600c:1e12:b0:434:fd15:3adc with SMTP id
 5b1f17b1804b1-434fd153f18mr13116705e9.25.1733747885593; 
 Mon, 09 Dec 2024 04:38:05 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d43b8557sm130234165e9.1.2024.12.09.04.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:38:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 19/26] rust: rename qemu-api modules to follow C code a bit
 more
Date: Mon,  9 Dec 2024 13:37:10 +0100
Message-ID: <20241209123717.99077-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -tf2TuesuWXsnPFr-20VgCVk4T5JJdnGtZkqUa8DACE_1733747887
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

A full match would mean calling them qom::object and hw::core::qdev.  For now,
keep the names shorter but still a bit easier to find.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs              |  4 +-
 rust/qemu-api-macros/src/lib.rs               |  2 +-
 rust/qemu-api/meson.build                     |  5 +-
 rust/qemu-api/src/lib.rs                      |  5 +-
 rust/qemu-api/src/module.rs                   | 43 +++++++++++
 rust/qemu-api/src/prelude.rs                  |  2 +-
 .../qemu-api/src/{device_class.rs => qdev.rs} |  4 +-
 rust/qemu-api/src/{definitions.rs => qom.rs}  | 74 +++++++++----------
 rust/qemu-api/src/sysbus.rs                   |  2 +-
 rust/qemu-api/tests/tests.rs                  |  5 +-
 10 files changed, 92 insertions(+), 54 deletions(-)
 create mode 100644 rust/qemu-api/src/module.rs
 rename rust/qemu-api/src/{device_class.rs => qdev.rs} (97%)
 rename rust/qemu-api/src/{definitions.rs => qom.rs} (83%)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index d9e9f35f456..3fed8b4ad25 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -11,10 +11,10 @@
 use qemu_api::{
     bindings::{self, *},
     c_str,
-    definitions::ObjectImpl,
-    device_class::DeviceImpl,
     irq::InterruptSource,
     prelude::*,
+    qdev::DeviceImpl,
+    qom::ObjectImpl,
 };
 
 use crate::{
diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index cf99ac04b8f..74a8bc7503e 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -40,7 +40,7 @@ pub fn derive_object(input: TokenStream) -> TokenStream {
     let expanded = quote! {
         ::qemu_api::module_init! {
             MODULE_INIT_QOM => unsafe {
-                ::qemu_api::bindings::type_register_static(&<#name as ::qemu_api::definitions::ObjectImpl>::TYPE_INFO);
+                ::qemu_api::bindings::type_register_static(&<#name as ::qemu_api::qom::ObjectImpl>::TYPE_INFO);
             }
         }
     };
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index adcee661150..7ff408ad68e 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -19,11 +19,12 @@ _qemu_api_rs = static_library(
       'src/bitops.rs',
       'src/cell.rs',
       'src/c_str.rs',
-      'src/definitions.rs',
-      'src/device_class.rs',
       'src/irq.rs',
+      'src/module.rs',
       'src/offset_of.rs',
       'src/prelude.rs',
+      'src/qdev.rs',
+      'src/qom.rs',
       'src/sysbus.rs',
       'src/vmstate.rs',
       'src/zeroable.rs',
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index 9e007e16354..124bece0449 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -15,10 +15,11 @@
 pub mod bitops;
 pub mod c_str;
 pub mod cell;
-pub mod definitions;
-pub mod device_class;
 pub mod irq;
+pub mod module;
 pub mod offset_of;
+pub mod qdev;
+pub mod qom;
 pub mod sysbus;
 pub mod vmstate;
 pub mod zeroable;
diff --git a/rust/qemu-api/src/module.rs b/rust/qemu-api/src/module.rs
new file mode 100644
index 00000000000..fa5cea3598f
--- /dev/null
+++ b/rust/qemu-api/src/module.rs
@@ -0,0 +1,43 @@
+// Copyright 2024, Linaro Limited
+// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+//! Macro to register blocks of code that run as QEMU starts up.
+
+#[macro_export]
+macro_rules! module_init {
+    ($type:ident => $body:block) => {
+        const _: () = {
+            #[used]
+            #[cfg_attr(
+                not(any(target_vendor = "apple", target_os = "windows")),
+                link_section = ".init_array"
+            )]
+            #[cfg_attr(target_vendor = "apple", link_section = "__DATA,__mod_init_func")]
+            #[cfg_attr(target_os = "windows", link_section = ".CRT$XCU")]
+            pub static LOAD_MODULE: extern "C" fn() = {
+                extern "C" fn init_fn() {
+                    $body
+                }
+
+                extern "C" fn ctor_fn() {
+                    unsafe {
+                        $crate::bindings::register_module_init(
+                            Some(init_fn),
+                            $crate::bindings::module_init_type::$type,
+                        );
+                    }
+                }
+
+                ctor_fn
+            };
+        };
+    };
+
+    // shortcut because it's quite common that $body needs unsafe {}
+    ($type:ident => unsafe $body:block) => {
+        $crate::module_init! {
+            $type => { unsafe { $body } }
+        }
+    };
+}
diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
index 1b8677b2d9a..5cc41f081f9 100644
--- a/rust/qemu-api/src/prelude.rs
+++ b/rust/qemu-api/src/prelude.rs
@@ -7,4 +7,4 @@
 pub use crate::cell::BqlCell;
 pub use crate::cell::BqlRefCell;
 
-pub use crate::definitions::ObjectType;
+pub use crate::qom::ObjectType;
diff --git a/rust/qemu-api/src/device_class.rs b/rust/qemu-api/src/qdev.rs
similarity index 97%
rename from rust/qemu-api/src/device_class.rs
rename to rust/qemu-api/src/qdev.rs
index 285dfe582c7..1228dabaaaf 100644
--- a/rust/qemu-api/src/device_class.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -2,12 +2,14 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+//! Bindings to create devices and access device functionality from Rust.
+
 use std::ffi::CStr;
 
 use crate::{
     bindings::{self, DeviceClass, DeviceState, Error, ObjectClass, Property, VMStateDescription},
-    definitions::ClassInitImpl,
     prelude::*,
+    qom::ClassInitImpl,
     zeroable::Zeroable,
 };
 
diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/qom.rs
similarity index 83%
rename from rust/qemu-api/src/definitions.rs
rename to rust/qemu-api/src/qom.rs
index 958ea34decc..9b316e07efa 100644
--- a/rust/qemu-api/src/definitions.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -2,7 +2,37 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-//! Definitions required by QEMU when registering a device.
+//! Bindings to access QOM functionality from Rust.
+//!
+//! This module provides automatic creation and registration of `TypeInfo`
+//! for classes that are written in Rust, and mapping between Rust traits
+//! and QOM vtables.
+//!
+//! # Structure of a class
+//!
+//! A concrete class only needs a struct holding instance state. The struct must
+//! implement the [`ObjectType`] and [`IsA`] traits, as well as any `*Impl`
+//! traits provided by its superclasses.
+//!
+//! An abstract class will also provide a struct for instance data, with the
+//! same characteristics as for concrete classes, but it also needs additional
+//! components to support virtual methods:
+//!
+//! * a struct for instance data, with the same characteristics as for concrete
+//!   classes.
+//!
+//! * a struct for class data, for example `DeviceClass`. This corresponds to
+//!   the C "class struct" and holds the vtable that is used by instances of the
+//!   class and its subclasses. It must start with its parent's class struct.
+//!
+//! * a trait for virtual method implementations, for example `DeviceImpl`.
+//!   Child classes implement this trait to provide their own behavior for
+//!   virtual methods. The trait's methods take `&self` to access instance data.
+//!
+//! * an implementation of [`ClassInitImpl`], for example
+//!   `ClassInitImpl<DeviceClass>`. This fills the vtable in the class struct,
+//!   typically with wrappers that call into the
+//!   [`DeviceImpl`](crate::qdev::DeviceImpl) implementations.
 
 use std::{ffi::CStr, os::raw::c_void};
 
@@ -136,7 +166,7 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
 ///
 /// Fortunately, this is almost never necessary.  Instead, the Rust
 /// implementation of methods will usually come from a trait like
-/// [`ObjectImpl`] or [`DeviceImpl`](crate::device_class::DeviceImpl).
+/// [`ObjectImpl`] or [`DeviceImpl`](crate::qdev::DeviceImpl).
 /// `ClassInitImpl` then can be provided by blanket implementations
 /// that operate on all implementors of the `*Impl`* trait.  For example:
 ///
@@ -162,7 +192,7 @@ pub trait ClassInitImpl<T> {
     /// can change them to override virtual methods of a parent class.
     ///
     /// The virtual method implementations usually come from another
-    /// trait, for example [`DeviceImpl`](crate::device_class::DeviceImpl)
+    /// trait, for example [`DeviceImpl`](crate::qdev::DeviceImpl)
     /// when `T` is [`DeviceClass`](crate::bindings::DeviceClass).
     ///
     /// On entry, `klass`'s parent class is initialized, while the other fields
@@ -174,44 +204,6 @@ pub trait ClassInitImpl<T> {
     fn class_init(klass: &mut T);
 }
 
-#[macro_export]
-macro_rules! module_init {
-    ($type:ident => $body:block) => {
-        const _: () = {
-            #[used]
-            #[cfg_attr(
-                not(any(target_vendor = "apple", target_os = "windows")),
-                link_section = ".init_array"
-            )]
-            #[cfg_attr(target_vendor = "apple", link_section = "__DATA,__mod_init_func")]
-            #[cfg_attr(target_os = "windows", link_section = ".CRT$XCU")]
-            pub static LOAD_MODULE: extern "C" fn() = {
-                extern "C" fn init_fn() {
-                    $body
-                }
-
-                extern "C" fn ctor_fn() {
-                    unsafe {
-                        $crate::bindings::register_module_init(
-                            Some(init_fn),
-                            $crate::bindings::module_init_type::$type,
-                        );
-                    }
-                }
-
-                ctor_fn
-            };
-        };
-    };
-
-    // shortcut because it's quite common that $body needs unsafe {}
-    ($type:ident => unsafe $body:block) => {
-        $crate::module_init! {
-            $type => { unsafe { $body } }
-        }
-    };
-}
-
 /// # Safety
 ///
 /// We expect the FFI user of this function to pass a valid pointer that
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index 5d15b317405..fa69cadd7c1 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -9,9 +9,9 @@
 use crate::{
     bindings::{self, DeviceClass},
     cell::bql_locked,
-    definitions::ClassInitImpl,
     irq::InterruptSource,
     prelude::*,
+    qom::ClassInitImpl,
 };
 
 unsafe impl ObjectType for SysBusDevice {
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 4ce1bd19247..fc57eb81290 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -7,10 +7,9 @@
 use qemu_api::{
     bindings::*,
     c_str, declare_properties, define_property,
-    definitions::ObjectImpl,
-    device_class::DeviceImpl,
-    impl_device_class,
     prelude::*,
+    qdev::DeviceImpl,
+    qom::ObjectImpl,
     zeroable::Zeroable,
 };
 
-- 
2.47.1


