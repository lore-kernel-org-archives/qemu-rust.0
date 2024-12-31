Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3E-0003Q5-0F
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3C-0003Oy-7i
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3A-0001yq-AZ
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQ9f8TEIbiidaBdHdliac2j4M4b1C9RXDFq4BMn1MtE=;
 b=g6749X3zrJN7oh2PbU51NUoYwnlL2r/mY+F8K+cEk1iRyXq2bndY0UQ7iWgvW5G77Rib72
 TwU3yndRh8/VzwSVoEg0PsiDDaNg0nPQlFECHKmS/9RaX/rja4KrsbyHsADwSVCEEhrmA6
 eGKzyvzRPH+/wbI/LtoaGQ6M1sWVHlE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-vdvWnPoPNieUaeN5Bew7Ew-1; Mon, 30 Dec 2024 19:23:53 -0500
X-MC-Unique: vdvWnPoPNieUaeN5Bew7Ew-1
X-Mimecast-MFC-AGG-ID: vdvWnPoPNieUaeN5Bew7Ew
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385ed79291eso5006450f8f.0
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604632; x=1736209432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQ9f8TEIbiidaBdHdliac2j4M4b1C9RXDFq4BMn1MtE=;
 b=RZ8w6HHNMidLWr/v1KWl32ChXILCez8NGjP940b1OFLXmeFJ/10jQq+lNmImAy/+K3
 +80fhBhqwqzWg9f5pmHpIdxVzHQritXmUdfZv2xda7HZ/Z1YodLH1yXMmZ7jh1JiiBgz
 Yr9jmh3gibXwLHnDPv+Z8soco5rusTQ6jTxP3lqOFVaGXfU7n8wQ6YUasMd+Gs6tFCIn
 TsiRWfGV1hD92eEXmuCkYThuY9mMFG3fcYDsgtgLTZ74zzTLla90Q8NLvDBrPzkQajWY
 OMx9CcgYGF290qqxHlq1wwnS/4llX5UiqN/F/1XBt/oFTEeDl+GnFIUGL4wjHrjJO8fm
 9s/A==
X-Gm-Message-State: AOJu0YxbeyZxPUFnd1IDMruZAV8EUHps8xDZxPQWwhZLQNApjjsqYON8
 KBoXOEmDAi9H7Pq53USGqn9Ce4mL0rGF06kYt2dK7YUNJIlDU/pnsobxC4j4MmlqH4SmfkzMXYV
 Xv24LoZdjSN8l4IizgqmrL/B3OLfCm8+wsR8JDnSjtTldBOnUsebuE4Py3sfdbg==
X-Gm-Gg: ASbGncuLaUHknDTQKwIETgk7uwD36qdQZPD8WPK+LlXQspKlYRpy9UaQRDlCM5OhrMI
 QVZ7t9CEDH0ffYX9o4e6Bn3Exra4y5KsmLJkghUaiVUAc7VW57Dg6ml9eY6dex367EhsDjFNx/c
 EXcEQKceAsgMGtAL8Me6z23IuTKek8N8TQVQxJT6P878XnyaEd8bEX8RCcVDkQauGov6vLgh9rM
 zcfdhjeKXsBn5ZQNCfN9SRJ5NnN2KMytdTVaSm9Z5UxXyxr5IydW8/Drn8=
X-Received: by 2002:a05:6000:1569:b0:386:3327:4f21 with SMTP id
 ffacd0b85a97d-38a22a648f7mr27522047f8f.27.1735604631606; 
 Mon, 30 Dec 2024 16:23:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXRkrAOdJIh9dRizoOccNa1BQJwzUhNZq9xlXOOZ6F4+nA5NEw9V7RQsz/zLaw5QqEfvQ7yQ==
X-Received: by 2002:a05:6000:1569:b0:386:3327:4f21 with SMTP id
 ffacd0b85a97d-38a22a648f7mr27522034f8f.27.1735604631244; 
 Mon, 30 Dec 2024 16:23:51 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2f9sm32122371f8f.81.2024.12.30.16.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 5/9] rust: vmstate: implement VMState for scalar types
Date: Tue, 31 Dec 2024 01:23:32 +0100
Message-ID: <20241231002336.25931-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vPwjB6kkMOUiuPtLO-4nOUwvmjO2IVTET3pxHGnrGR0_1735604632
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 31 Dec 2024 00:23:58 -0000

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
 rust/qemu-api/src/vmstate.rs | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 49d0a3c31d4..edd0cbff162 100644
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
@@ -58,6 +61,70 @@ const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> { ::core::marker:
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
@@ -66,6 +133,12 @@ const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> { ::core::marker:
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
@@ -80,6 +153,12 @@ pub unsafe trait VMState {
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
@@ -96,11 +175,20 @@ pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateField
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
 macro_rules! vmstate_of {
-    ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:expr)?])? $(,)?) => {
+    ($struct_name:ty, $field_name:ident $([0 .. $num:tt $(* $factor:expr)?])? $(,)?) => {
         $crate::bindings::VMStateField {
             name: ::core::concat!(::core::stringify!($field_name), "\0")
                 .as_bytes()
@@ -109,6 +197,11 @@ macro_rules! vmstate_of {
             $(.num_offset: $crate::offset_of!($struct_name, $num),)?
             // The calls to `call_func_with_field!` are the magic that
             // computes most of the VMStateField from the type of the field.
+            info: $crate::info_enum_to_ref!($crate::call_func_with_field!(
+                $crate::vmstate::vmstate_scalar_type,
+                $struct_name,
+                $field_name
+            )),
             ..$crate::call_func_with_field!(
                 $crate::vmstate::vmstate_base,
                 $struct_name,
@@ -175,6 +268,7 @@ pub const fn with_varray_multiply(mut self, num: u32) -> VMStateField {
 macro_rules! impl_vmstate_transparent {
     ($type:ty where $base:tt: VMState $($where:tt)*) => {
         unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
+            const SCALAR_TYPE: VMStateFieldType = <$base as VMState>::SCALAR_TYPE;
             const BASE: VMStateField = VMStateField {
                 size: mem::size_of::<$type>(),
                 ..<$base as VMState>::BASE
@@ -189,6 +283,33 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
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
 
 macro_rules! impl_vmstate_pointer {
-- 
2.47.1


