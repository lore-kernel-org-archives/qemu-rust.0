Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSQ3F-0003R6-5Q
	for mharc-qemu-rust@gnu.org; Mon, 30 Dec 2024 19:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3D-0003Pz-QY
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tSQ3C-0001zK-3o
 for qemu-rust@nongnu.org; Mon, 30 Dec 2024 19:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735604637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaU78OtHlJWbowYJ8XZBMHDaIpSDaRcsvAM49uU4qxs=;
 b=Jt47PJGnv5NPoC7lvKGcC523ijlPwCFBgtCTjklAV5IIUM0s0lXlidm1FzcA0IweDqGc9l
 kA6W52BfSgDF7FowiPUp6/k2ZAE9HipKCV0ge/8Hg05JcaxOU6qa7hKMW40rb6Wrk0CRb5
 FWX+zseqG0YPE8VVP71LuwxeURj8VSA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-Kp1Som6BPduttZHUheZZaw-1; Mon, 30 Dec 2024 19:23:56 -0500
X-MC-Unique: Kp1Som6BPduttZHUheZZaw-1
X-Mimecast-MFC-AGG-ID: Kp1Som6BPduttZHUheZZaw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436289a570eso75335765e9.0
 for <qemu-rust@nongnu.org>; Mon, 30 Dec 2024 16:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735604635; x=1736209435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VaU78OtHlJWbowYJ8XZBMHDaIpSDaRcsvAM49uU4qxs=;
 b=cy1x+zp0pjZG+MRNzpPnafFzH1fGrZ5HWMKMICPFqSsmA7AekrWFotMxuSqEZo8qxj
 g6rH7ibrSaVik6QS0/WqoWhi0gcL6jo2g3ITslT6OWg9M6Pd5rREz1yoOP3viji+CsnL
 G9rp5jbbAq92Fn35jvsR8StupqeD1ApRne/OlwyzGj4P5XqFhYd3ItKnS3jYermC2PuG
 oki+QL6Lu3/IfNf6odU/8p6TOJWC7Svy1G7nekLppwKl/kRz8XWELVnR5KMDJTDDWsLW
 j/oXY5DhymtMxcKC7hpl6j6SBQUpSK1quypnpAaSiL1A08Nh+jD+IZi0FlwBn18KmNia
 6Myw==
X-Gm-Message-State: AOJu0YwcV119zJHFrTJMVinP1ut3b+h66SbOEnlSFKYf9bbOW/KSim5P
 3ly9arM6LB62u1VwTxd2Dv5BFe4EAQqDt9FdHtBCMGF7clFWsyOV/jL3LdVzuITAqPe1VnZ2ha6
 8ogjKhejfef+gcQUP2sZUByG/U823sD4NfbzTMCevE20aHRU5WzI=
X-Gm-Gg: ASbGncsWMhCbteoEUCRCBZ/Wa7LxEei70nkYgfksV7MXdTdAw0PtjOMfePXhc5RGN1s
 pdFp2eKEfWGBMUcxHmuSE3kwEk4wy1y3evt3fvS9KTaipd0EhK6FOs4G/t14vmPsv8Vuh19PvE/
 AhZlSYQZr927kbh/u+SGX2kaZmeedyPYXR6ZmrIXqkSZrWMxojkgNWKNOFdoxw00r7QCm3hxBTI
 qQVPch9ViD1futpaN7WA1rn0i2Zx9h/kyZ1UeYQWMfJmzDQnUxTFfsouZ0=
X-Received: by 2002:a05:600c:474d:b0:436:18d0:aa6e with SMTP id
 5b1f17b1804b1-4366835c14fmr318088325e9.5.1735604635003; 
 Mon, 30 Dec 2024 16:23:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGv6MHM4uX/eSI1Yj4SlGnN6UDDzvj8TAuWNjWh6ZA6/Px/vud18hBBxDwj2WuqBsSw1WX/rA==
X-Received: by 2002:a05:600c:474d:b0:436:18d0:aa6e with SMTP id
 5b1f17b1804b1-4366835c14fmr318088235e9.5.1735604634600; 
 Mon, 30 Dec 2024 16:23:54 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436612008b1sm367949045e9.15.2024.12.30.16.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:23:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com,
	junjie.mao@hotmail.com
Subject: [RFC PATCH 6/9] rust: vmstate: add public utility macros to implement
 VMState
Date: Tue, 31 Dec 2024 01:23:33 +0100
Message-ID: <20241231002336.25931-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231002336.25931-1-pbonzini@redhat.com>
References: <20241231002336.25931-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tVvYJ2cvy6Uieqe8LlPRemnDEMOc9lc1vHshZ-aBGAA_1735604635
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.187,
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
X-List-Received-Date: Tue, 31 Dec 2024 00:24:00 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/vmstate.rs | 61 ++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index edd0cbff162..b59a4b66339 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -4,13 +4,18 @@
 
 //! Helper macros to declare migration state for device models.
 //!
-//! This module includes three families of macros:
+//! This module includes four families of macros:
 //!
 //! * [`vmstate_unused!`](crate::vmstate_unused) and
 //!   [`vmstate_of!`](crate::vmstate_of), which are used to express the
 //!   migration format for a struct.  This is based on the [`VMState`] trait,
 //!   which is defined by all migrateable types.
 //!
+//! * [`impl_vmstate_forward`](crate::impl_vmstate_forward) and
+//!   [`impl_vmstate_bitsized`](crate::impl_vmstate_bitsized), which help with
+//!   the definition of the [`VMState`] trait (respectively for transparent
+//!   structs and for `bilge`-defined types)
+//!
 //! * helper macros to declare a device model state struct, in particular
 //!   [`vmstate_subsections`](crate::vmstate_subsections) and
 //!   [`vmstate_fields`](crate::vmstate_fields).
@@ -131,7 +136,9 @@ macro_rules! info_enum_to_ref {
 /// # Safety
 ///
 /// The contents of this trait go straight into structs that are parsed by C
-/// code and used to introspect into other structs.  Be careful.
+/// code and used to introspect into other structs.  Generally, you don't need
+/// to implement it except via macros that do it for you, such as
+/// `impl_vmstate_bitsized!`.
 pub unsafe trait VMState {
     /// The `info` member of a `VMStateField` is a pointer and as such cannot
     /// yet be included in the [`BASE`](VMState::BASE) associated constant;
@@ -185,7 +192,9 @@ pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateField
 /// * an array of any of the above
 ///
 /// In order to support other types, the trait `VMState` must be implemented
-/// for them.
+/// for them.  The macros
+/// [`impl_vmstate_bitsized!`](crate::impl_vmstate_bitsized)
+/// and [`impl_vmstate_forward!`](crate::impl_vmstate_forward) help with this.
 #[macro_export]
 macro_rules! vmstate_of {
     ($struct_name:ty, $field_name:ident $([0 .. $num:tt $(* $factor:expr)?])? $(,)?) => {
@@ -263,6 +272,32 @@ pub const fn with_varray_multiply(mut self, num: u32) -> VMStateField {
     }
 }
 
+/// This macro can be used (by just passing it a type) to forward the `VMState`
+/// trait to the first field of a tuple.  This is a workaround for lack of
+/// support of nested [`offset_of`](core::mem::offset_of) until Rust 1.82.0.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::vmstate::impl_vmstate_forward;
+/// pub struct Fifo([u8; 16]);
+/// impl_vmstate_forward!(Fifo);
+/// ```
+#[macro_export]
+macro_rules! impl_vmstate_forward {
+    // This is similar to impl_vmstate_transparent below, but it
+    // uses the same trick as vmstate_of! to obtain the type of
+    // the first field of the tuple
+    ($tuple:ty) => {
+        unsafe impl $crate::vmstate::VMState for $tuple {
+            const SCALAR_TYPE: $crate::vmstate::VMStateFieldType =
+                $crate::call_func_with_field!($crate::vmstate::vmstate_scalar_type, $tuple, 0);
+            const BASE: $crate::bindings::VMStateField =
+                $crate::call_func_with_field!($crate::vmstate::vmstate_base, $tuple, 0);
+        }
+    };
+}
+
 // Transparent wrappers: just use the internal type
 
 macro_rules! impl_vmstate_transparent {
@@ -283,6 +318,26 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 impl_vmstate_transparent!(crate::cell::BqlCell<T> where T: VMState);
 impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState);
 
+#[macro_export]
+macro_rules! impl_vmstate_bitsized {
+    ($type:ty) => {
+        unsafe impl $crate::vmstate::VMState for $type {
+            const SCALAR_TYPE: $crate::vmstate::VMStateFieldType =
+                                        <<<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
+                                          as ::bilge::prelude::Number>::UnderlyingType
+                                         as $crate::vmstate::VMState>::SCALAR_TYPE;
+            const BASE: $crate::bindings::VMStateField =
+                                        <<<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
+                                          as ::bilge::prelude::Number>::UnderlyingType
+                                         as $crate::vmstate::VMState>::BASE;
+            const VARRAY_FLAG: $crate::bindings::VMStateFlags =
+                                        <<<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
+                                          as ::bilge::prelude::Number>::UnderlyingType
+                                         as $crate::vmstate::VMState>::VARRAY_FLAG;
+        }
+    };
+}
+
 // Scalar types using predefined VMStateInfos
 
 macro_rules! impl_vmstate_scalar {
-- 
2.47.1


