Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHefZ-0004sk-6U
	for mharc-qemu-rust@gnu.org; Wed, 21 May 2025 04:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefR-0004pv-El
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHefO-0000D9-Cz
 for qemu-rust@nongnu.org; Wed, 21 May 2025 04:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747815545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYNNR8kxdpigAzsfIWV54lNrAJSCQ81aFM7IBOhn2ic=;
 b=eMEBvgruZeN0WF4LB79gwKMoghcIJg8h3ING2969hnAG/XkAsVmbdlWlZEoc74JXmshbd+
 baFKHkn+1/5KZaD/pTzXt+W1v79HCv9teityivKPdhBTXBwZph1nF77sklJfz7MCB43Rpa
 BqEk2WYzvI9I+VQdm5UQ8XYIGMgdaSU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-6dSTy8H5NNy7nfE0locuYw-1; Wed, 21 May 2025 04:19:04 -0400
X-MC-Unique: 6dSTy8H5NNy7nfE0locuYw-1
X-Mimecast-MFC-AGG-ID: 6dSTy8H5NNy7nfE0locuYw_1747815543
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a3561206b3so2124190f8f.2
 for <qemu-rust@nongnu.org>; Wed, 21 May 2025 01:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747815542; x=1748420342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYNNR8kxdpigAzsfIWV54lNrAJSCQ81aFM7IBOhn2ic=;
 b=HaHIvwWHO8j8yTcUdDgXewfxsLRo5mC2Qvy67EDkNRY8ys/dlXN7xNh/uD9UkHrtzJ
 ygNdjyc+59SZJv7p+Bzi7ebOwkV28rAS68lL6HEeAUe9Hvr3HWSHqV2127fzh49RWDZA
 sPuv1cOkVByv5QW5gc6Hv9qTPTmX9ejRW4uNd48mglb+bx5DTay1SimrgQsJYDQZv2dA
 3GbduDEHvpA3J+vBdP9bojJzlJQfNdExRb2QLgOQNC6XAYC3nPtPSpJjPjNJohR7JahR
 JZeDn/qqxKxqlxQMyJbHLwa2OITJVAHaYIkDw0bU0LrzlGU1QTDp2wa8d2O2EAtILkcl
 NW4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdNmp+5QCylEnN/pxqhWH2JI8mKKWtpdq+ucE4NNQeBPLT4DoNmecq7/qyp3tYZ9MEVdcy5PAd/hc=@nongnu.org
X-Gm-Message-State: AOJu0Yw53SQonL2/9gxsITjwtIoqng+R8hg09q/L09VGpSCSfzd0vRAV
 ylfqTxRQ7hXJedq9zNfRn4WJexYSRxlAODP/uSjRrRanIoEdYDq6pWS9AztvVsdTqNYkpGhE/B6
 TzJdLjQAh3tOi3rrv5rjYgT1Gu1WMdu1AGHxu28mTy90h414Mt8qF7+DGGW2OhzE=
X-Gm-Gg: ASbGncs6JS/s/HjyFU76FSsbo9cVMfULDncHvGajSOzwXXZ6O+eetPHkMWIj+Y7EcaI
 rlbys6QwJDd2PSJvLwpYnZet22LXmCvw7tUFtGky0EC9KQxsgNaFvBFAxi3IQWhnecvi0TnH5FP
 pufJNAYc03b7fUkqtr4oiqHypbCMG1jh0cMz72qkCACv/ZQ39cxK1m497oIggJWG7dKEMH/a5Ys
 dAQPCzw0qqrTEpT4S7r2HjcrcW2qkcftS2KvqV+98N11G5ADp12WqJPX96AVzuEAt/QnYN4Fkrv
 07TvxCImlTEuNA==
X-Received: by 2002:a05:6000:2912:b0:3a3:7cbd:39b1 with SMTP id
 ffacd0b85a97d-3a37cbd3a4amr3969539f8f.24.1747815542134; 
 Wed, 21 May 2025 01:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTv4UneDWAAT5256cTYhIwEYTuV/wYGAzeZOfqdtUiMDzLj9p2MCij0/aDKFQHgODH8wa6EQ==
X-Received: by 2002:a05:6000:2912:b0:3a3:7cbd:39b1 with SMTP id
 ffacd0b85a97d-3a37cbd3a4amr3969500f8f.24.1747815541606; 
 Wed, 21 May 2025 01:19:01 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a36749f622sm15154505f8f.93.2025.05.21.01.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 01:19:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-rust@nongnu.org,
 manos.pitsidianakis@linaro.org
Subject: [RFC PATCH 6/6] rust: remove bilge crate
Date: Wed, 21 May 2025 10:18:45 +0200
Message-ID: <20250521081845.496442-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521081845.496442-1-pbonzini@redhat.com>
References: <20250521081845.496442-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xwIMJDR4SMSQi0gxakW5M5PYZZcrCL955yRCY1P97Aw_1747815543
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.487,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 21 May 2025 08:19:15 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.lock                             | 71 ++-------------------
 rust/qemu-api/src/vmstate.rs                | 34 ++--------
 subprojects/.gitignore                      |  7 --
 subprojects/arbitrary-int-1-rs.wrap         | 10 ---
 subprojects/bilge-0.2-rs.wrap               | 10 ---
 subprojects/bilge-impl-0.2-rs.wrap          | 10 ---
 subprojects/either-1-rs.wrap                | 10 ---
 subprojects/itertools-0.11-rs.wrap          | 10 ---
 subprojects/proc-macro-error-1-rs.wrap      | 10 ---
 subprojects/proc-macro-error-attr-1-rs.wrap | 10 ---
 10 files changed, 10 insertions(+), 172 deletions(-)
 delete mode 100644 subprojects/arbitrary-int-1-rs.wrap
 delete mode 100644 subprojects/bilge-0.2-rs.wrap
 delete mode 100644 subprojects/bilge-impl-0.2-rs.wrap
 delete mode 100644 subprojects/either-1-rs.wrap
 delete mode 100644 subprojects/itertools-0.11-rs.wrap
 delete mode 100644 subprojects/proc-macro-error-1-rs.wrap
 delete mode 100644 subprojects/proc-macro-error-attr-1-rs.wrap

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index bccfe855a70..29ac523bfdb 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -3,29 +3,11 @@
 version = 3
 
 [[package]]
-name = "arbitrary-int"
-version = "1.2.7"
+name = "bitfield-struct"
+version = "0.9.5"
 source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "c84fc003e338a6f69fbd4f7fe9f92b535ff13e9af8997f3b14b6ddff8b1df46d"
-
-[[package]]
-name = "bilge"
-version = "0.2.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "dc707ed8ebf81de5cd6c7f48f54b4c8621760926cdf35a57000747c512e67b57"
+checksum = "b2869c63ccf4f8bf0d485070b880e60e097fb7aeea80ee82a0a94a957e372a0b"
 dependencies = [
- "arbitrary-int",
- "bilge-impl",
-]
-
-[[package]]
-name = "bilge-impl"
-version = "0.2.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "feb11e002038ad243af39c2068c8a72bcf147acf05025dcdb916fcc000adb2d8"
-dependencies = [
- "itertools",
- "proc-macro-error",
  "proc-macro2",
  "quote",
  "syn",
@@ -38,12 +20,6 @@ dependencies = [
  "qemu_api_macros",
 ]
 
-[[package]]
-name = "either"
-version = "1.12.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b"
-
 [[package]]
 name = "hpet"
 version = "0.1.0"
@@ -52,15 +28,6 @@ dependencies = [
  "qemu_api_macros",
 ]
 
-[[package]]
-name = "itertools"
-version = "0.11.0"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
-dependencies = [
- "either",
-]
-
 [[package]]
 name = "libc"
 version = "0.2.162"
@@ -71,36 +38,12 @@ checksum = "18d287de67fe55fd7e1581fe933d965a5a9477b38e949cfa9f8574ef01506398"
 name = "pl011"
 version = "0.1.0"
 dependencies = [
- "bilge",
- "bilge-impl",
+ "bitfield-struct",
  "bits",
  "qemu_api",
  "qemu_api_macros",
 ]
 
-[[package]]
-name = "proc-macro-error"
-version = "1.0.4"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-dependencies = [
- "proc-macro-error-attr",
- "proc-macro2",
- "quote",
- "version_check",
-]
-
-[[package]]
-name = "proc-macro-error-attr"
-version = "1.0.4"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-dependencies = [
- "proc-macro2",
- "quote",
- "version_check",
-]
-
 [[package]]
 name = "proc-macro2"
 version = "1.0.84"
@@ -152,9 +95,3 @@ name = "unicode-ident"
 version = "1.0.12"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-
-[[package]]
-name = "version_check"
-version = "0.9.4"
-source = "registry+https://github.com/rust-lang/crates.io-index"
-checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 9c8b2398e9d..38faf6ce0dc 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -11,10 +11,9 @@
 //!   migration format for a struct.  This is based on the [`VMState`] trait,
 //!   which is defined by all migrateable types.
 //!
-//! * [`impl_vmstate_forward`](crate::impl_vmstate_forward) and
-//!   [`impl_vmstate_bitsized`](crate::impl_vmstate_bitsized), which help with
-//!   the definition of the [`VMState`] trait (respectively for transparent
-//!   structs and for `bilge`-defined types)
+//! * [`impl_vmstate_forward`](crate::impl_vmstate_forward), which help with the
+//!   definition of the [`VMState`] trait (respectively for transparent structs
+//!   and for `bilge`-defined types)
 //!
 //! * helper macros to declare a device model state struct, in particular
 //!   [`vmstate_subsections`](crate::vmstate_subsections) and
@@ -141,7 +140,7 @@ macro_rules! info_enum_to_ref {
 /// The contents of this trait go straight into structs that are parsed by C
 /// code and used to introspect into other structs.  Generally, you don't need
 /// to implement it except via macros that do it for you, such as
-/// `impl_vmstate_bitsized!`.
+/// `impl_vmstate_forward!`.
 pub unsafe trait VMState {
     /// The `info` member of a `VMStateField` is a pointer and as such cannot
     /// yet be included in the [`BASE`](VMState::BASE) associated constant;
@@ -195,9 +194,8 @@ pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateFlags
 /// * an array of any of the above
 ///
 /// In order to support other types, the trait `VMState` must be implemented
-/// for them.  The macros
-/// [`impl_vmstate_bitsized!`](crate::impl_vmstate_bitsized)
-/// and [`impl_vmstate_forward!`](crate::impl_vmstate_forward) help with this.
+/// for them.  The macro
+/// [`impl_vmstate_forward!`](crate::impl_vmstate_forward) helps with this.
 #[macro_export]
 macro_rules! vmstate_of {
     ($struct_name:ty, $field_name:ident $([0 .. $num:ident $(* $factor:expr)?])? $(, $test_fn:expr)? $(,)?) => {
@@ -345,26 +343,6 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 impl_vmstate_transparent!(crate::cell::BqlRefCell<T> where T: VMState);
 impl_vmstate_transparent!(crate::cell::Opaque<T> where T: VMState);
 
-#[macro_export]
-macro_rules! impl_vmstate_bitsized {
-    ($type:ty) => {
-        unsafe impl $crate::vmstate::VMState for $type {
-            const SCALAR_TYPE: $crate::vmstate::VMStateFieldType =
-                                        <<<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
-                                          as ::bilge::prelude::Number>::UnderlyingType
-                                         as $crate::vmstate::VMState>::SCALAR_TYPE;
-            const BASE: $crate::bindings::VMStateField =
-                                        <<<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
-                                          as ::bilge::prelude::Number>::UnderlyingType
-                                         as $crate::vmstate::VMState>::BASE;
-            const VARRAY_FLAG: $crate::bindings::VMStateFlags =
-                                        <<<$type as ::bilge::prelude::Bitsized>::ArbitraryInt
-                                          as ::bilge::prelude::Number>::UnderlyingType
-                                         as $crate::vmstate::VMState>::VARRAY_FLAG;
-        }
-    };
-}
-
 // Scalar types using predefined VMStateInfos
 
 macro_rules! impl_vmstate_scalar {
diff --git a/subprojects/.gitignore b/subprojects/.gitignore
index 180c3134864..183700d986e 100644
--- a/subprojects/.gitignore
+++ b/subprojects/.gitignore
@@ -6,15 +6,8 @@
 /keycodemapdb
 /libvfio-user
 /slirp
-/arbitrary-int-1.2.7
-/bilge-0.2.0
-/bilge-impl-0.2.0
 /bitfield-struct-0.9.5
-/either-1.12.0
-/itertools-0.11.0
 /libc-0.2.162
-/proc-macro-error-1.0.4
-/proc-macro-error-attr-1.0.4
 /proc-macro2-1.0.84
 /quote-1.0.36
 /syn-2.0.66
diff --git a/subprojects/arbitrary-int-1-rs.wrap b/subprojects/arbitrary-int-1-rs.wrap
deleted file mode 100644
index a1838b20b0f..00000000000
--- a/subprojects/arbitrary-int-1-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = arbitrary-int-1.2.7
-source_url = https://crates.io/api/v1/crates/arbitrary-int/1.2.7/download
-source_filename = arbitrary-int-1.2.7.tar.gz
-source_hash = c84fc003e338a6f69fbd4f7fe9f92b535ff13e9af8997f3b14b6ddff8b1df46d
-#method = cargo
-patch_directory = arbitrary-int-1-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
diff --git a/subprojects/bilge-0.2-rs.wrap b/subprojects/bilge-0.2-rs.wrap
deleted file mode 100644
index 900bb1497b9..00000000000
--- a/subprojects/bilge-0.2-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = bilge-0.2.0
-source_url = https://crates.io/api/v1/crates/bilge/0.2.0/download
-source_filename = bilge-0.2.0.tar.gz
-source_hash = dc707ed8ebf81de5cd6c7f48f54b4c8621760926cdf35a57000747c512e67b57
-#method = cargo
-patch_directory = bilge-0.2-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
diff --git a/subprojects/bilge-impl-0.2-rs.wrap b/subprojects/bilge-impl-0.2-rs.wrap
deleted file mode 100644
index 4f84eca1ccd..00000000000
--- a/subprojects/bilge-impl-0.2-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = bilge-impl-0.2.0
-source_url = https://crates.io/api/v1/crates/bilge-impl/0.2.0/download
-source_filename = bilge-impl-0.2.0.tar.gz
-source_hash = feb11e002038ad243af39c2068c8a72bcf147acf05025dcdb916fcc000adb2d8
-#method = cargo
-patch_directory = bilge-impl-0.2-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
diff --git a/subprojects/either-1-rs.wrap b/subprojects/either-1-rs.wrap
deleted file mode 100644
index 352e11cfee6..00000000000
--- a/subprojects/either-1-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = either-1.12.0
-source_url = https://crates.io/api/v1/crates/either/1.12.0/download
-source_filename = either-1.12.0.tar.gz
-source_hash = 3dca9240753cf90908d7e4aac30f630662b02aebaa1b58a3cadabdb23385b58b
-#method = cargo
-patch_directory = either-1-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
diff --git a/subprojects/itertools-0.11-rs.wrap b/subprojects/itertools-0.11-rs.wrap
deleted file mode 100644
index ee12d0053bc..00000000000
--- a/subprojects/itertools-0.11-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = itertools-0.11.0
-source_url = https://crates.io/api/v1/crates/itertools/0.11.0/download
-source_filename = itertools-0.11.0.tar.gz
-source_hash = b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57
-#method = cargo
-patch_directory = itertools-0.11-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
diff --git a/subprojects/proc-macro-error-1-rs.wrap b/subprojects/proc-macro-error-1-rs.wrap
deleted file mode 100644
index 59f892f7825..00000000000
--- a/subprojects/proc-macro-error-1-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = proc-macro-error-1.0.4
-source_url = https://crates.io/api/v1/crates/proc-macro-error/1.0.4/download
-source_filename = proc-macro-error-1.0.4.tar.gz
-source_hash = da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
-#method = cargo
-patch_directory = proc-macro-error-1-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
diff --git a/subprojects/proc-macro-error-attr-1-rs.wrap b/subprojects/proc-macro-error-attr-1-rs.wrap
deleted file mode 100644
index 5aeb224a103..00000000000
--- a/subprojects/proc-macro-error-attr-1-rs.wrap
+++ /dev/null
@@ -1,10 +0,0 @@
-[wrap-file]
-directory = proc-macro-error-attr-1.0.4
-source_url = https://crates.io/api/v1/crates/proc-macro-error-attr/1.0.4/download
-source_filename = proc-macro-error-attr-1.0.4.tar.gz
-source_hash = a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
-#method = cargo
-patch_directory = proc-macro-error-attr-1-rs
-
-# bump this version number on every change to meson.build or the patches:
-# v2
-- 
2.49.0


