Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiE6-0001tG-EB
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiE2-0001s2-UV
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiE0-00084J-Jl
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdreYeMEubtp69jK34KWNVurrSUZ81kztZbhs4Qnr14=;
 b=PPuWOJltkHhTk9l2e8A/H6TlffxaophhHE2M+rXxHfZIqzPVU5WYnkElG03k5cd9KXrQPN
 P56ba+76W8eWnXERxajrPCHBD6cLQd5Az5u1wCDO/fkC5QLAcwHNkbX6KEAAb/Lqyp0a02
 y46uA0OKX+GHiozAiUv7w7LttBwkK2M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-m_9uZ0hfNAOIYICktrG8Qg-1; Fri, 17 Jan 2025 04:01:06 -0500
X-MC-Unique: m_9uZ0hfNAOIYICktrG8Qg-1
X-Mimecast-MFC-AGG-ID: m_9uZ0hfNAOIYICktrG8Qg
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa67f18cb95so183421366b.1
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104464; x=1737709264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xdreYeMEubtp69jK34KWNVurrSUZ81kztZbhs4Qnr14=;
 b=ww7kpDfhsDLrZ9S5L6Ta0YUUoRsV2PAJGEUwVut4vsxqzw+fdxOVCgR2dqYj6JQaPp
 98TdcatIHd+7EXPEd0K1nCBWoXJRnWjFxi/SuagupcnVV+nM/pyq5LavQ9MasEMZVcie
 azDaipAsqM7Lw7Nax8+dyUGVQuLxPoBosNQP+f8HCff7FixyvzkNpUuSQ7/7Qoy1ILQO
 rSsiio51rJ6fhz4DMyoAHb4P4szn/Yc796HlqxmFQaeXH+prNUEEPQ0SShQkOSVC4NZ5
 +D/djbRUkOGWk3CSz5pAiBliHzDDicslhudvMfRyq5duVvLjERG1wtZFV39yxw/BrDvS
 5F2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs279MHEe3qvBzUjx1eC/1UA9Y41S3UXQaaWQ+Q6pIcBSfR7EhWLQqKqy5f+hTZjyrbe3WG1wtQYg=@nongnu.org
X-Gm-Message-State: AOJu0Ywft7w5m8J9XBzp2GPN1DUWTgrW8mF/QcpRC7onu9s7UXCVXgCO
 xV7MavZ3XS1kLfwPj7ht/Yi7E+SrLklclbPtsL3eMz5MTNe53/w3KsoRGyR7+8Vn20xN+2jRuA9
 E9MIl10YE2NZzHvqk37R8Xgx44lZrzyHMo+DIGGfh3Aluh57BagrA6a1WaLUuQA==
X-Gm-Gg: ASbGnct0BMTvIbi/ufgl2CbX9xlcwVLNDC5HLVR5c9HXXy4peCNjJ7mkNJoIz0c9O03
 shqRIjI+TBwNWKovQD3YGcKfIaZeLLdsQGkoxHtnv6fmwJwR/AOWsilMeuT51n0BqH756/IuOnl
 Cr5F2GWu7TenEbNoZkkrtALUl2Cz8V48CsIdDqj64qncatTzV5wkfXQdWt5iO3ygzKNMMjhakdM
 G85EHoGWYGaKO3R3t/xrJ/ghwWn6p1LPzyD8aHhu9VYAxKAazjTNqJN/ZVW
X-Received: by 2002:a17:907:da1:b0:aa6:2a17:b54c with SMTP id
 a640c23a62f3a-ab38b0b90cemr140565466b.6.1737104464135; 
 Fri, 17 Jan 2025 01:01:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZaX3okgIENGKGPd3rboDkpet2tArpnH9QQT90G2DeRuoPWbhXI0s19A0Ujf9WwzIfjHfobw==
X-Received: by 2002:a17:907:da1:b0:aa6:2a17:b54c with SMTP id
 a640c23a62f3a-ab38b0b90cemr140562066b.6.1737104463613; 
 Fri, 17 Jan 2025 01:01:03 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384fcbb46sm133128666b.166.2025.01.17.01.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:01:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 05/10] rust: vmstate: implement VMState for scalar types
Date: Fri, 17 Jan 2025 10:00:41 +0100
Message-ID: <20250117090046.1045010-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HdTGhYYHB4gva6iC3NGcEpgFHA_y--7oEtHC4cGSwFM_1737104465
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:11 -0000

Scalar types are those that have their own VMStateInfo.  This poses
a problem in that references to VMStateInfo can only be included in
associated consts starting with Rust 1.83.0, when the const_refs_static
was stabilized.  Removing the requirement is done by placing a limited
list of VMStateInfos in an enum, and going from enum to &VMStateInfo
only when building the VMStateField.

The same thing cannot be done with VMS_STRUCT because the set of
VMStateDescriptions extends to structs defined by the devices.
Therefore, structs and cells cannot yet use vmstate_of!.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 128 ++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 22a5ed50d4a..b0a2ce105cc 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -21,8 +21,11 @@
 
 use core::{marker::PhantomData, mem, ptr::NonNull};
 
-pub use crate::bindings::{VMStateDescription, VMStateField};
 use crate::bindings::VMStateFlags;
+pub use crate::{
+    bindings::{self, VMStateDescription, VMStateField},
+    zeroable::Zeroable,
+};
 
 /// This macro is used to call a function with a generic argument bound
 /// to the type of a field.  The function must take a
@@ -61,6 +64,70 @@ const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> { ::core::marker:
     };
 }
 
+/// Workaround for lack of `const_refs_static`: references to global variables
+/// can be included in a `static`, but not in a `const`; unfortunately, this
+/// is exactly what would go in the `VMStateField`'s `info` member.
+///
+/// This enum contains the contents of the `VMStateField`'s `info` member,
+/// but as an `enum` instead of a pointer.
+#[allow(non_camel_case_types)]
+pub enum VMStateFieldType {
+    null,
+    vmstate_info_bool,
+    vmstate_info_int8,
+    vmstate_info_int16,
+    vmstate_info_int32,
+    vmstate_info_int64,
+    vmstate_info_uint8,
+    vmstate_info_uint16,
+    vmstate_info_uint32,
+    vmstate_info_uint64,
+    vmstate_info_timer,
+}
+
+/// Workaround for lack of `const_refs_static`.  Converts a `VMStateFieldType`
+/// to a `*const VMStateInfo`, for inclusion in a `VMStateField`.
+#[macro_export]
+macro_rules! info_enum_to_ref {
+    ($e:expr) => {
+        unsafe {
+            match $e {
+                $crate::vmstate::VMStateFieldType::null => ::core::ptr::null(),
+                $crate::vmstate::VMStateFieldType::vmstate_info_bool => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_bool)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_int8 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_int8)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_int16 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_int16)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_int32 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_int32)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_int64 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_int64)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_uint8 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_uint8)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_uint16 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_uint16)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_uint32 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_uint32)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_uint64 => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_uint64)
+                }
+                $crate::vmstate::VMStateFieldType::vmstate_info_timer => {
+                    ::core::ptr::addr_of!($crate::bindings::vmstate_info_timer)
+                }
+            }
+        }
+    };
+}
+
 /// A trait for types that can be included in a device's migration stream.  It
 /// provides the base contents of a `VMStateField` (minus the name and offset).
 ///
@@ -69,6 +136,12 @@ const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> { ::core::marker:
 /// The contents of this trait go straight into structs that are parsed by C
 /// code and used to introspect into other structs.  Be careful.
 pub unsafe trait VMState {
+    /// The `info` member of a `VMStateField` is a pointer and as such cannot
+    /// yet be included in the [`BASE`](VMState::BASE) associated constant;
+    /// this is only allowed by Rust 1.83.0 and newer.  For now, include the
+    /// member as an enum which is stored in a separate constant.
+    const SCALAR_TYPE: VMStateFieldType = VMStateFieldType::null;
+
     /// The base contents of a `VMStateField` (minus the name and offset) for
     /// the type that is implementing the trait.
     const BASE: VMStateField;
@@ -83,6 +156,12 @@ pub unsafe trait VMState {
     };
 }
 
+/// Internal utility function to retrieve a type's `VMStateFieldType`;
+/// used by [`vmstate_of!`](crate::vmstate_of).
+pub const fn vmstate_scalar_type<T: VMState>(_: PhantomData<T>) -> VMStateFieldType {
+    T::SCALAR_TYPE
+}
+
 /// Internal utility function to retrieve a type's `VMStateField`;
 /// used by [`vmstate_of!`](crate::vmstate_of).
 pub const fn vmstate_base<T: VMState>(_: PhantomData<T>) -> VMStateField {
@@ -99,6 +178,15 @@ pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateField
 /// Return the `VMStateField` for a field of a struct.  The field must be
 /// visible in the current scope.
 ///
+/// Only a limited set of types is supported out of the box:
+/// * scalar types (integer and `bool`)
+/// * the C struct `QEMUTimer`
+/// * a transparent wrapper for any of the above (`Cell`, `UnsafeCell`,
+///   [`BqlCell`](crate::cell::BqlCell), [`BqlRefCell`](crate::cell::BqlRefCell)
+/// * a raw pointer to any of the above
+/// * a `NonNull` pointer to any of the above, possibly wrapped with `Option`
+/// * an array of any of the above
+///
 /// In order to support other types, the trait `VMState` must be implemented
 /// for them.
 #[macro_export]
@@ -109,8 +197,14 @@ macro_rules! vmstate_of {
                 .as_bytes()
                 .as_ptr() as *const ::std::os::raw::c_char,
             offset: $crate::offset_of!($struct_name, $field_name),
-            // Compute most of the VMStateField from the type of the field.
             $(.num_offset: $crate::offset_of!($struct_name, $num),)?
+            // The calls to `call_func_with_field!` are the magic that
+            // computes most of the VMStateField from the type of the field.
+            info: $crate::info_enum_to_ref!($crate::call_func_with_field!(
+                $crate::vmstate::vmstate_scalar_type,
+                $struct_name,
+                $field_name
+            )),
             ..$crate::call_func_with_field!(
                 $crate::vmstate::vmstate_base,
                 $struct_name,
@@ -187,6 +281,7 @@ pub const fn with_varray_multiply(mut self, num: u32) -> VMStateField {
 macro_rules! impl_vmstate_transparent {
     ($type:ty where $base:tt: VMState $($where:tt)*) => {
         unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
+            const SCALAR_TYPE: VMStateFieldType = <$base as VMState>::SCALAR_TYPE;
             const BASE: VMStateField = VMStateField {
                 size: mem::size_of::<$type>(),
                 ..<$base as VMState>::BASE
@@ -201,6 +296,33 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 impl_vmstate_transparent!(crate::cell::BqlCell<T> where T: VMState);
 impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState);
 
+// Scalar types using predefined VMStateInfos
+
+macro_rules! impl_vmstate_scalar {
+    ($info:ident, $type:ty$(, $varray_flag:ident)?) => {
+        unsafe impl VMState for $type {
+            const SCALAR_TYPE: VMStateFieldType = VMStateFieldType::$info;
+            const BASE: VMStateField = VMStateField {
+                size: mem::size_of::<$type>(),
+                flags: VMStateFlags::VMS_SINGLE,
+                ..Zeroable::ZERO
+            };
+            $(const VARRAY_FLAG: VMStateFlags = VMStateFlags::$varray_flag;)?
+        }
+    };
+}
+
+impl_vmstate_scalar!(vmstate_info_bool, bool);
+impl_vmstate_scalar!(vmstate_info_int8, i8);
+impl_vmstate_scalar!(vmstate_info_int16, i16);
+impl_vmstate_scalar!(vmstate_info_int32, i32);
+impl_vmstate_scalar!(vmstate_info_int64, i64);
+impl_vmstate_scalar!(vmstate_info_uint8, u8, VMS_VARRAY_UINT8);
+impl_vmstate_scalar!(vmstate_info_uint16, u16, VMS_VARRAY_UINT16);
+impl_vmstate_scalar!(vmstate_info_uint32, u32, VMS_VARRAY_UINT32);
+impl_vmstate_scalar!(vmstate_info_uint64, u64);
+impl_vmstate_scalar!(vmstate_info_timer, bindings::QEMUTimer);
+
 // Pointer types using the underlying type's VMState plus VMS_POINTER
 // Note that references are not supported, though references to cells
 // could be allowed.
@@ -208,6 +330,7 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 macro_rules! impl_vmstate_pointer {
     ($type:ty where $base:tt: VMState $($where:tt)*) => {
         unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
+            const SCALAR_TYPE: VMStateFieldType = <T as VMState>::SCALAR_TYPE;
             const BASE: VMStateField = <$base as VMState>::BASE.with_pointer_flag();
         }
     };
@@ -225,6 +348,7 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 // VMS_ARRAY/VMS_ARRAY_OF_POINTER
 
 unsafe impl<T: VMState, const N: usize> VMState for [T; N] {
+    const SCALAR_TYPE: VMStateFieldType = <T as VMState>::SCALAR_TYPE;
     const BASE: VMStateField = <T as VMState>::BASE.with_array_flag(N);
 }
 
-- 
2.47.1


