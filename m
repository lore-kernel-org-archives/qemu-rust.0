Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYiE0-0001rU-4t
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDu-0001pb-6P
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYiDs-00082W-8D
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737104457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvXKMgEe/XNJgIWOzfE8NdJOesl0DV+BIsQqqBzCXzQ=;
 b=R5SDf8sIoqUfVYM3dE/J3gxjiffc8i/TFaC9FJ2Nbzkc1F5kt11ta/SghP5s8yk+HDhe8J
 s0ykdh+1vfo7JWAJQQFloAJb+Tl31l6AdxnN5Fyo59ciMPrCCUzvnUh6YpKAomyHMavLdo
 5OeY0ADPu6DazoP5Ll5+VXC9cFQxrPI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-0ifGv0AwPTiRvecP8j3k4Q-1; Fri, 17 Jan 2025 04:00:54 -0500
X-MC-Unique: 0ifGv0AwPTiRvecP8j3k4Q-1
X-Mimecast-MFC-AGG-ID: 0ifGv0AwPTiRvecP8j3k4Q
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab341e14e27so250107566b.3
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104453; x=1737709253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvXKMgEe/XNJgIWOzfE8NdJOesl0DV+BIsQqqBzCXzQ=;
 b=GLuV3u73Amg6wuCcnhmkutKmdhE7P7BiizAX8d14jwfLWvF/hs9K6tDJeUuMwNF50I
 Zrl7PlEdZBHNUj7FR5SA9NTlZIU2Os1+ZWD8+3lXIxSgDQECbLih3VFWz7UirMptArQ1
 yz0CgWylHSDAhGJD8IjqOd+17OoPUUw9wKPUSD19LfEAKrDxZisIq/snAhjxsnhACEJc
 EOPmVWiuYBwa4YXtYywhR5hIKFtw6kTOvr3Si6Pvw9h1sJVmC18cnFMnkAJ2GRs9saQc
 q1bHyzddEugOsaPFKKCdqyy5RwzwDmV7MsodXH+3cOFvtdjWt6MTeT0D4E1vNv056h9n
 JuVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqYLuslT5vv8jceqFk0HM8xOw+Ugw1YyPpNvLsFstlUp5zT2Iso6uQNtQ3tAzjIDw5psJecDUGmCs=@nongnu.org
X-Gm-Message-State: AOJu0Yx00EJK5Y7LkzD+34FnZE4VyWZkGPgOmfOFaV3BSVGT55JIPKnF
 prLjHypHz8uGtgxaUM2uGrij0GlK8JxZUtkVPUep+/5BM/PZ0gXZx9rd6jTg6jQEAFp8H1/H4Dp
 RUf5j/ZEoIXzXpu/7vZoEf5Cu+xDNLwXqiY52Zj0TXqLcZSzvQEI7ggOHj9IyOA==
X-Gm-Gg: ASbGncsg2Cng6UGhQyz3NPmYVIKt0WnDUTqVw1tBEG8OcqidCfh4iB/9afUtgvWfNFV
 WOiOSD5a7WlXqtewYGQMxDBB3mccnvs26NxEUme3DZGM1RVmnTvcG10zzefWbkkPXAsgX60V8ue
 Oan8FDnwm/wCq11jvyyP1G2uUMTtaUMT7g7VOar422YEN5zz7/u2RWY5MwJtpebeM4Z6DCkI60m
 etJBfetX9DW1g+zKf2EmHPpo1UoH7CuQfuBHFWT8rXG3BYxGiwMoD0Jkjyy
X-Received: by 2002:a17:907:3f90:b0:aa6:6f92:74b1 with SMTP id
 a640c23a62f3a-ab38b231a83mr181797366b.13.1737104452548; 
 Fri, 17 Jan 2025 01:00:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvqhUySBEw8Q64pnKUaRda8OnfrPnt/UYfBdTwM2ymJyrk5d86ahPNa4PT2etge9Az8gYbtQ==
X-Received: by 2002:a17:907:3f90:b0:aa6:6f92:74b1 with SMTP id
 a640c23a62f3a-ab38b231a83mr181793666b.13.1737104452035; 
 Fri, 17 Jan 2025 01:00:52 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384ce1f1asm138026466b.58.2025.01.17.01.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:00:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 01/10] rust: vmstate: add new type safe implementation
Date: Fri, 17 Jan 2025 10:00:37 +0100
Message-ID: <20250117090046.1045010-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117090046.1045010-1-pbonzini@redhat.com>
References: <20250117090046.1045010-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jw-ynFVAA2cPzo6RYz9xMZv-80tRYqfoI3BaTnhcwuc_1737104454
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
X-List-Received-Date: Fri, 17 Jan 2025 09:01:04 -0000

The existing translation of the C macros for vmstate does not make
any attempt to type-check vmstate declarations against the struct, so
introduce a new system that computes VMStateField based on the actual
struct declaration.

Macros do not have full access to the type system, therefore a full
implementation of this scheme requires a helper trait to analyze the
type and produce a VMStateField from it; a macro "vmstate_of!" accepts
arguments similar to "offset_of!" and tricks the compiler into looking
up the trait for the right type.

The patch introduces not just vmstate_of!, but also the slightly too
clever enabling macro call_func_with_field!.  The particular trick used
here was proposed on the users.rust-lang.org forum, so I take no merit
and all the blame.

Introduce the trait and some functions to access it; the actual
implementation comes later.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/prelude.rs |   2 +
 rust/qemu-api/src/vmstate.rs | 113 +++++++++++++++++++++++++++++++++--
 2 files changed, 109 insertions(+), 6 deletions(-)

diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
index 4ea70b9c823..2dc86e19b29 100644
--- a/rust/qemu-api/src/prelude.rs
+++ b/rust/qemu-api/src/prelude.rs
@@ -18,3 +18,5 @@
 pub use crate::qom_isa;
 
 pub use crate::sysbus::SysBusDeviceMethods;
+
+pub use crate::vmstate::VMState;
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 63c897abcdf..b839a7d6b7f 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -4,13 +4,114 @@
 
 //! Helper macros to declare migration state for device models.
 //!
-//! Some macros are direct equivalents to the C macros declared in
-//! `include/migration/vmstate.h` while
-//! [`vmstate_subsections`](crate::vmstate_subsections) and
-//! [`vmstate_fields`](crate::vmstate_fields) are meant to be used when
-//! declaring a device model state struct.
+//! This module includes three families of macros:
+//!
+//! * [`vmstate_unused!`](crate::vmstate_unused) and
+//!   [`vmstate_of!`](crate::vmstate_of), which are used to express the
+//!   migration format for a struct.  This is based on the [`VMState`] trait,
+//!   which is defined by all migrateable types.
+//!
+//! * helper macros to declare a device model state struct, in particular
+//!   [`vmstate_subsections`](crate::vmstate_subsections) and
+//!   [`vmstate_fields`](crate::vmstate_fields).
+//!
+//! * direct equivalents to the C macros declared in
+//!   `include/migration/vmstate.h`. These are not type-safe and should not be
+//!   used if the equivalent functionality is available with `vmstate_of!`.
 
-pub use crate::bindings::VMStateDescription;
+use core::marker::PhantomData;
+
+pub use crate::bindings::{VMStateDescription, VMStateField};
+
+/// This macro is used to call a function with a generic argument bound
+/// to the type of a field.  The function must take a
+/// [`PhantomData`]`<T>` argument; `T` is the type of
+/// field `$field` in the `$typ` type.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::call_func_with_field;
+/// # use core::marker::PhantomData;
+/// const fn size_of_field<T>(_: PhantomData<T>) -> usize {
+///     std::mem::size_of::<T>()
+/// }
+///
+/// struct Foo {
+///     x: u16,
+/// };
+/// // calls size_of_field::<u16>()
+/// assert_eq!(call_func_with_field!(size_of_field, Foo, x), 2);
+/// ```
+#[macro_export]
+macro_rules! call_func_with_field {
+    // Based on the answer by user steffahn (Frank Steffahn) at
+    // https://users.rust-lang.org/t/inferring-type-of-field/122857
+    // and used under MIT license
+    ($func:expr, $typ:ty, $($field:tt).+) => {
+        $func(loop {
+            #![allow(unreachable_code)]
+            const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> { ::core::marker::PhantomData }
+            // Unreachable code is exempt from checks on uninitialized values.
+            // Use that trick to infer the type of this PhantomData.
+            break ::core::marker::PhantomData;
+            break phantom__(&{ let value__: $typ; value__.$($field).+ });
+        })
+    };
+}
+
+/// A trait for types that can be included in a device's migration stream.  It
+/// provides the base contents of a `VMStateField` (minus the name and offset).
+///
+/// # Safety
+///
+/// The contents of this trait go straight into structs that are parsed by C
+/// code and used to introspect into other structs.  Be careful.
+pub unsafe trait VMState {
+    /// The base contents of a `VMStateField` (minus the name and offset) for
+    /// the type that is implementing the trait.
+    const BASE: VMStateField;
+}
+
+/// Internal utility function to retrieve a type's `VMStateField`;
+/// used by [`vmstate_of!`](crate::vmstate_of).
+pub const fn vmstate_base<T: VMState>(_: PhantomData<T>) -> VMStateField {
+    T::BASE
+}
+
+/// Return the `VMStateField` for a field of a struct.  The field must be
+/// visible in the current scope.
+///
+/// In order to support other types, the trait `VMState` must be implemented
+/// for them.
+#[macro_export]
+macro_rules! vmstate_of {
+    ($struct_name:ty, $field_name:ident $(,)?) => {
+        $crate::bindings::VMStateField {
+            name: ::core::concat!(::core::stringify!($field_name), "\0")
+                .as_bytes()
+                .as_ptr() as *const ::std::os::raw::c_char,
+            offset: $crate::offset_of!($struct_name, $field_name),
+            // Compute most of the VMStateField from the type of the field.
+            ..$crate::call_func_with_field!(
+                $crate::vmstate::vmstate_base,
+                $struct_name,
+                $field_name
+            )
+        }
+    };
+}
+
+// Add a couple builder-style methods to VMStateField, allowing
+// easy derivation of VMStateField constants from other types.
+impl VMStateField {
+    #[must_use]
+    pub const fn with_version_id(mut self, version_id: i32) -> Self {
+        assert!(version_id >= 0);
+        self.version_id = version_id;
+        self
+    }
+}
 
 #[doc(alias = "VMSTATE_UNUSED_BUFFER")]
 #[macro_export]
-- 
2.47.1


