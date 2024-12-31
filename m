Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3M-0003UL-T4
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3L-0003Tw-Ea
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3J-00020k-H9
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5/JvoYepda1ESoi0KW/7MoIKytb2HMTXeN82nQCUKA=;
 b=fHS8dg28I31XhqNuwyXA2ToZbuN5xy/YSfU54gtY3CyXyelIvWH8o2T2mTETdNBHGbAkyq
 1cwIZdb4h1Ir45eYoz6XVmYwhlUsoz57nyFx7oteBPtdi4K3Ucqw59GYkq7+kob1qE7MAx
 qIt/la1yHMyoiBPJ5AOiGtXi/LDXoKE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-L35w6VWqNN2EcQCUZ6r0cg-1; Mon, 30 Dec 2024 19:24:02 -0500
X-MC-Unique: L35w6VWqNN2EcQCUZ6r0cg-1
X-Mimecast-MFC-AGG-ID: L35w6VWqNN2EcQCUZ6r0cg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43646b453bcso9978145e9.3
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604642; x=1736209442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5/JvoYepda1ESoi0KW/7MoIKytb2HMTXeN82nQCUKA=;
 b=fLitYyBRt2SPuDFrdYE/yOVosCp8Elo+uXlKSuW2GQ4zrFwmUpWqY891RgW9fHMTqp
 6GYkTDjQ1QFUXBTnKX7KOEuV9BIuLIBzwllET7N2haG/5ZmJrCQhQCo/x/cw1Ka19hfP
 7T6UIhWYw2Q3IyzgOtjI+HHT6TfWQUI11wPmPvCsttymnC/Un1DYKy4W98Q9ROjB85GI
 S/iB72lQ0/PxP5pJamFWi9Y+jhrqh+jnWhszx2yex6cVzU/ixPCheen+V38CWsTakjCW
 0WZjPXtYhhvGRVzXRrzKigTyT+vuNjmRmwuDinh+h7+snjgN2Ingb5Ey25Lg81tDTcoV
 eWXg==
X-Gm-Message-State: AOJu0YwenjSnZg8V75r8Lb4U7fiWFaXiMiEh3O71jAtnhjpZxd/lGiWJ
 RxovCap2M6HbdmxeHYmpW1VJgwY8GFuETckpxI/S259YttL3j97Cqr0jiotaIPWkcxccMQLrIBL
 HcRT8Kk1KMv9PbuhHf0GY3ZzQTd1u76OBUXZaH2YqqThrUK7tqjE=
X-Gm-Gg: ASbGnctQFTptnGJ41C8uezYQ3ONi1Z1BndZiEIG2T3Xe2mpttoGs8mSXke8Jcgqb64M
 /DjsFGKGU2TelL0rdPeMG5YHGMvsBZ9rIs2Ol0MaPiUBnlnF+bSqRCwU0mSNctdWQksvzzaksVr
 vP+cOM0v5VvbZKCxIXbw0F6dCHzj8tKhRPsSgP/4UOkx07YUrqEPdHXeiZPyTnfZoKHr3pmjmd4
 9zACt0Dp1qzGOD6WvcUEXPouZ2HrS7+JcgIMfI1x0cBeQCV/unUdpnLqRc=
X-Received: by 2002:a5d:64e2:0:b0:388:cacf:24b5 with SMTP id
 ffacd0b85a97d-38a22408dc3mr33393957f8f.54.1735604641590; 
 Mon, 30 Dec 2024 16:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFup0I6+pZg/42dLfgAiUktVSsyxEMWs7Zz2wyj1Qj2PvNaK6+LQvNa7+rjUuP13uyfl8QEPQ==
X-Received: by 2002:a5d:64e2:0:b0:388:cacf:24b5 with SMTP id
 ffacd0b85a97d-38a22408dc3mr33393946f8f.54.1735604641239; 
 Mon, 30 Dec 2024 16:24:01 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b015absm404439075e9.13.2024.12.30.16.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:24:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 9/9] rust: vmstate: remove translation of C vmstate macros
Date: Tue, 31 Dec 2024 01:23:36 +0100
Message-ID: <20241231002336.25931-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8HW6PwnB9xOKws8GPn6FBZtKBUJgKhbABQQrKipGaf8_1735604642
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
X-List-Received-Date: Tue, 31 Dec 2024 00:24:07 -0000

Keep vmstate_clock!; because it uses a field of type VMStateDescription,
it cannot be converted to the VMState trait without access to the
const_refs_static feature.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 274 +++--------------------------------
 1 file changed, 23 insertions(+), 251 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index e45c93587b2..68246fce043 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -21,8 +21,8 @@
 //!   [`vmstate_fields`](crate::vmstate_fields).
 //!
 //! * direct equivalents to the C macros declared in
-//!   `include/migration/vmstate.h`. These are not type-safe and should not be
-//!   used if the equivalent functionality is available with `vmstate_of!`.
+//!   `include/migration/vmstate.h`. These are not type-safe and only provide
+//!   functionality that is missing from `vmstate_of!`.
 
 use core::{marker::PhantomData, mem, ptr::NonNull};
 
@@ -389,223 +389,16 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
     const BASE: VMStateField = <T as VMState>::BASE.with_array_flag(N);
 }
 
-#[doc(alias = "VMSTATE_UNUSED_BUFFER")]
-#[macro_export]
-macro_rules! vmstate_unused_buffer {
-    ($field_exists_fn:expr, $version_id:expr, $size:expr) => {{
-        $crate::bindings::VMStateField {
-            name: c_str!("unused").as_ptr(),
-            err_hint: ::core::ptr::null(),
-            offset: 0,
-            size: $size,
-            start: 0,
-            num: 0,
-            num_offset: 0,
-            size_offset: 0,
-            info: unsafe { ::core::ptr::addr_of!($crate::bindings::vmstate_info_unused_buffer) },
-            flags: VMStateFlags::VMS_BUFFER,
-            vmsd: ::core::ptr::null(),
-            version_id: $version_id,
-            struct_version_id: 0,
-            field_exists: $field_exists_fn,
-        }
-    }};
-}
-
-#[doc(alias = "VMSTATE_UNUSED_V")]
-#[macro_export]
-macro_rules! vmstate_unused_v {
-    ($version_id:expr, $size:expr) => {{
-        $crate::vmstate_unused_buffer!(None, $version_id, $size)
-    }};
-}
-
 #[doc(alias = "VMSTATE_UNUSED")]
 #[macro_export]
 macro_rules! vmstate_unused {
     ($size:expr) => {{
-        $crate::vmstate_unused_v!(0, $size)
-    }};
-}
-
-#[doc(alias = "VMSTATE_SINGLE_TEST")]
-#[macro_export]
-macro_rules! vmstate_single_test {
-    ($field_name:ident, $struct_name:ty, $field_exists_fn:expr, $version_id:expr, $info:expr, $size:expr) => {{
         $crate::bindings::VMStateField {
-            name: ::core::concat!(::core::stringify!($field_name), 0)
-                .as_bytes()
-                .as_ptr() as *const ::std::os::raw::c_char,
-            err_hint: ::core::ptr::null(),
-            offset: $crate::offset_of!($struct_name, $field_name),
+            name: $crate::c_str!("unused").as_ptr(),
             size: $size,
-            start: 0,
-            num: 0,
-            num_offset: 0,
-            size_offset: 0,
-            info: unsafe { $info },
-            flags: VMStateFlags::VMS_SINGLE,
-            vmsd: ::core::ptr::null(),
-            version_id: $version_id,
-            struct_version_id: 0,
-            field_exists: $field_exists_fn,
-        }
-    }};
-}
-
-#[doc(alias = "VMSTATE_SINGLE")]
-#[macro_export]
-macro_rules! vmstate_single {
-    ($field_name:ident, $struct_name:ty, $version_id:expr, $info:expr, $size:expr) => {{
-        $crate::vmstate_single_test!($field_name, $struct_name, None, $version_id, $info, $size)
-    }};
-}
-
-#[doc(alias = "VMSTATE_UINT32_V")]
-#[macro_export]
-macro_rules! vmstate_uint32_v {
-    ($field_name:ident, $struct_name:ty, $version_id:expr) => {{
-        $crate::vmstate_single!(
-            $field_name,
-            $struct_name,
-            $version_id,
-            ::core::ptr::addr_of!($crate::bindings::vmstate_info_uint32),
-            ::core::mem::size_of::<u32>()
-        )
-    }};
-}
-
-#[doc(alias = "VMSTATE_UINT32")]
-#[macro_export]
-macro_rules! vmstate_uint32 {
-    ($field_name:ident, $struct_name:ty) => {{
-        $crate::vmstate_uint32_v!($field_name, $struct_name, 0)
-    }};
-}
-
-#[doc(alias = "VMSTATE_ARRAY")]
-#[macro_export]
-macro_rules! vmstate_array {
-    ($field_name:ident, $struct_name:ty, $length:expr, $version_id:expr, $info:expr, $size:expr) => {{
-        $crate::bindings::VMStateField {
-            name: ::core::concat!(::core::stringify!($field_name), 0)
-                .as_bytes()
-                .as_ptr() as *const ::std::os::raw::c_char,
-            err_hint: ::core::ptr::null(),
-            offset: $crate::offset_of!($struct_name, $field_name),
-            size: $size,
-            start: 0,
-            num: $length as _,
-            num_offset: 0,
-            size_offset: 0,
-            info: unsafe { $info },
-            flags: VMStateFlags::VMS_ARRAY,
-            vmsd: ::core::ptr::null(),
-            version_id: $version_id,
-            struct_version_id: 0,
-            field_exists: None,
-        }
-    }};
-}
-
-#[doc(alias = "VMSTATE_UINT32_ARRAY_V")]
-#[macro_export]
-macro_rules! vmstate_uint32_array_v {
-    ($field_name:ident, $struct_name:ty, $length:expr, $version_id:expr) => {{
-        $crate::vmstate_array!(
-            $field_name,
-            $struct_name,
-            $length,
-            $version_id,
-            ::core::ptr::addr_of!($crate::bindings::vmstate_info_uint32),
-            ::core::mem::size_of::<u32>()
-        )
-    }};
-}
-
-#[doc(alias = "VMSTATE_UINT32_ARRAY")]
-#[macro_export]
-macro_rules! vmstate_uint32_array {
-    ($field_name:ident, $struct_name:ty, $length:expr) => {{
-        $crate::vmstate_uint32_array_v!($field_name, $struct_name, $length, 0)
-    }};
-}
-
-#[doc(alias = "VMSTATE_STRUCT_POINTER_V")]
-#[macro_export]
-macro_rules! vmstate_struct_pointer_v {
-    ($field_name:ident, $struct_name:ty, $version_id:expr, $vmsd:expr, $type:ty) => {{
-        $crate::bindings::VMStateField {
-            name: ::core::concat!(::core::stringify!($field_name), 0)
-                .as_bytes()
-                .as_ptr() as *const ::std::os::raw::c_char,
-            err_hint: ::core::ptr::null(),
-            offset: $crate::offset_of!($struct_name, $field_name),
-            size: ::core::mem::size_of::<*const $type>(),
-            start: 0,
-            num: 0,
-            num_offset: 0,
-            size_offset: 0,
-            info: ::core::ptr::null(),
-            flags: VMStateFlags(VMStateFlags::VMS_STRUCT.0 | VMStateFlags::VMS_POINTER.0),
-            vmsd: unsafe { $vmsd },
-            version_id: $version_id,
-            struct_version_id: 0,
-            field_exists: None,
-        }
-    }};
-}
-
-#[doc(alias = "VMSTATE_ARRAY_OF_POINTER")]
-#[macro_export]
-macro_rules! vmstate_array_of_pointer {
-    ($field_name:ident, $struct_name:ty, $num:expr, $version_id:expr, $info:expr, $type:ty) => {{
-        $crate::bindings::VMStateField {
-            name: ::core::concat!(::core::stringify!($field_name), 0)
-                .as_bytes()
-                .as_ptr() as *const ::std::os::raw::c_char,
-            version_id: $version_id,
-            num: $num as _,
-            info: unsafe { $info },
-            size: ::core::mem::size_of::<*const $type>(),
-            flags: VMStateFlags(VMStateFlags::VMS_ARRAY.0 | VMStateFlags::VMS_ARRAY_OF_POINTER.0),
-            offset: $crate::offset_of!($struct_name, $field_name),
-            err_hint: ::core::ptr::null(),
-            start: 0,
-            num_offset: 0,
-            size_offset: 0,
-            vmsd: ::core::ptr::null(),
-            struct_version_id: 0,
-            field_exists: None,
-        }
-    }};
-}
-
-#[doc(alias = "VMSTATE_ARRAY_OF_POINTER_TO_STRUCT")]
-#[macro_export]
-macro_rules! vmstate_array_of_pointer_to_struct {
-    ($field_name:ident, $struct_name:ty, $num:expr, $version_id:expr, $vmsd:expr, $type:ty) => {{
-        $crate::bindings::VMStateField {
-            name: ::core::concat!(::core::stringify!($field_name), 0)
-                .as_bytes()
-                .as_ptr() as *const ::std::os::raw::c_char,
-            version_id: $version_id,
-            num: $num as _,
-            vmsd: unsafe { $vmsd },
-            size: ::core::mem::size_of::<*const $type>(),
-            flags: VMStateFlags(
-                VMStateFlags::VMS_ARRAY.0
-                    | VMStateFlags::VMS_STRUCT.0
-                    | VMStateFlags::VMS_ARRAY_OF_POINTER.0,
-            ),
-            offset: $crate::offset_of!($struct_name, $field_name),
-            err_hint: ::core::ptr::null(),
-            start: 0,
-            num_offset: 0,
-            size_offset: 0,
-            vmsd: ::core::ptr::null(),
-            struct_version_id: 0,
-            field_exists: None,
+            info: unsafe { ::core::ptr::addr_of!($crate::bindings::vmstate_info_unused_buffer) },
+            flags: $crate::bindings::VMStateFlags::VMS_BUFFER,
+            ..$crate::zeroable::Zeroable::ZERO
         }
     }};
 }
@@ -644,48 +437,27 @@ macro_rules! vmstate_cell {
     };
 }
 
-#[doc(alias = "VMSTATE_CLOCK_V")]
-#[macro_export]
-macro_rules! vmstate_clock_v {
-    ($field_name:ident, $struct_name:ty, $version_id:expr) => {{
-        $crate::vmstate_struct_pointer_v!(
-            $field_name,
-            $struct_name,
-            $version_id,
-            ::core::ptr::addr_of!($crate::bindings::vmstate_clock),
-            $crate::bindings::Clock
-        )
-    }};
-}
-
 #[doc(alias = "VMSTATE_CLOCK")]
 #[macro_export]
 macro_rules! vmstate_clock {
     ($field_name:ident, $struct_name:ty) => {{
-        $crate::vmstate_clock_v!($field_name, $struct_name, 0)
-    }};
-}
-
-#[doc(alias = "VMSTATE_ARRAY_CLOCK_V")]
-#[macro_export]
-macro_rules! vmstate_array_clock_v {
-    ($field_name:ident, $struct_name:ty, $num:expr, $version_id:expr) => {{
-        $crate::vmstate_array_of_pointer_to_struct!(
-            $field_name,
-            $struct_name,
-            $num,
-            $version_id,
-            ::core::ptr::addr_of!($crate::bindings::vmstate_clock),
-            $crate::bindings::Clock
-        )
-    }};
-}
-
-#[doc(alias = "VMSTATE_ARRAY_CLOCK")]
-#[macro_export]
-macro_rules! vmstate_array_clock {
-    ($field_name:ident, $struct_name:ty, $num:expr) => {{
-        $crate::vmstate_array_clock_v!($field_name, $struct_name, $name, 0)
+        $crate::bindings::VMStateField {
+            name: ::core::concat!(::core::stringify!($field_name), "\0")
+                .as_bytes()
+                .as_ptr() as *const ::std::os::raw::c_char,
+            offset: {
+                $crate::assert_field_type!(
+                    $struct_name,
+                    $field_name,
+                    core::ptr::NonNull<$crate::bindings::Clock>
+                );
+                $crate::offset_of!($struct_name, $field_name)
+            },
+            size: ::core::mem::size_of::<*const $crate::bindings::Clock>(),
+            flags: VMStateFlags(VMStateFlags::VMS_STRUCT.0 | VMStateFlags::VMS_POINTER.0),
+            vmsd: unsafe { ::core::ptr::addr_of!($crate::bindings::vmstate_clock) },
+            ..$crate::zeroable::Zeroable::ZERO
+        }
     }};
 }
 
-- 
2.47.1


