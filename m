Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE4CCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Elk-00007N-Rk; Fri, 10 Oct 2025 11:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Elj-00005V-2g
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7ElP-000478-Pf
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FZgvDx1lu9fJSdOxBvB+MMur5Jir4fvIS9bMP6QLM0=;
 b=SmiToTy4uT32PDXuEfoLvqtq+k7dYJ1gvJqeMFYJI3FCe+1VO4tFzHqT2RT/+T1wEUWkRd
 txAVQF8Ee/pVQDnyOMhtca2EpVBEHlnancOeOOGctfkYFXvKp37Ejdea5Hela+DC/BLjyF
 9wRavPtQWJ/dbRfIaY2exUGb9nLmpI8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-7yZvPLO-PkK_oSO9ISN-Hw-1; Fri, 10 Oct 2025 11:10:26 -0400
X-MC-Unique: 7yZvPLO-PkK_oSO9ISN-Hw-1
X-Mimecast-MFC-AGG-ID: 7yZvPLO-PkK_oSO9ISN-Hw_1760109025
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b3d6645acd3so247172866b.1
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109023; x=1760713823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FZgvDx1lu9fJSdOxBvB+MMur5Jir4fvIS9bMP6QLM0=;
 b=ChjfckdqV8/LbCs8v6j3tAOvJ4dMgk3AUD4l+EesU+C6kMmdv68QdvFptqLTTfbAj2
 pKTW0d5NjVXO6ZN6hoLLHfJ1qAPjQMZ9bfEabcAMeySg1sZvaSeOHTgxEDl4lk8o+fKN
 NxVPQO+lyuN5gPgBiaaHwxKbqoFsGRT8Rj678lPFaofDvJ2zeIngV7gKSYzhBrD4+SY4
 6hEpZdEj9JdjOmPa7zegtx3GZ+2eiJHg+BEz18CEVa7AR1ymGYFxVJw2f+5Mb63UF5x2
 w2Lie+8puWB40P7nSsAihP1w03/8897BI3ZoBb0CigYb2y5mztsosrS53hJqz7rjSEtA
 zlDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4+fx0fMQu1v3P5/9mIME5NkLNG2OX5tnBNHlgVMvJ9IuKPIWms82HaEBPng+L/8kK28c7BRRMlAk=@nongnu.org
X-Gm-Message-State: AOJu0Yxpys1xTC3PAk6Po4qdMkKr6RI7H0wRM6V2YZsOGobWQJ/itSaZ
 tNHo6msGtGz2snemj6O1dGnBpMG583OGjQrhWFvnmPn/TOwrIVobduH++4hxqQ1KQqhOPbxwQqc
 zivBA5OXwVQFGs6xMjbe0l83tWhFeGPYuWeNxhLxUC20VtJmLHMLlukpXRByVDGw=
X-Gm-Gg: ASbGncuUXip/o8xlWSD3xvDx+gnveDiQ2HxOlz/I+ZMm3XcVMXuZLpnTrkMDLocF1tV
 bd1SF+vMPf5Zpx32x8gUoWDapeCbscPwZWnQD9VXombKwz599lLFeMUq7ytZpG0PfQ1uR62p5l6
 c8ueD44pLBHW97k5Kku11NQtBUxLxAz2fuML+GUot1rAwyV9nIuD7a4unjGtBSw1bP+195RbG8x
 RyBJtQzHAjw2aX2Lxx90CDnqrIIG+v1uOWH1jfomAte02AWoqom8bLtCRkxQy4LjFFBvUNW5lrp
 T21VSdVCd1HKLlVFUTX9vzfJxVp3NOxJIhuJJwv3M2z2JPG1hS+DEKs6oQmliAS5EqK8xD00idS
 MkZjpcP455pVQJYBNwL1lQRtn1snodDVvkyu2LpcvLZQ0
X-Received: by 2002:a17:906:6a14:b0:b44:2d0:e05f with SMTP id
 a640c23a62f3a-b50ac2cf494mr1311063666b.33.1760109023228; 
 Fri, 10 Oct 2025 08:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTnWAf1thJZKPgL7ao/5GeYS/n+TrYEjpV4ceOm1F1ZsP59hS6+z1hjorwGFq0K+CGDu7qXQ==
X-Received: by 2002:a17:906:6a14:b0:b44:2d0:e05f with SMTP id
 a640c23a62f3a-b50ac2cf494mr1311060466b.33.1760109022780; 
 Fri, 10 Oct 2025 08:10:22 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12ccbsm249043566b.46.2025.10.10.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 06/19] rust/qobject: add Serialize implementation
Date: Fri, 10 Oct 2025 17:09:51 +0200
Message-ID: <20251010151006.791038-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wrcgbyy-2vSUYBY-uI2kfaheiWKSClIXeFurhGkW1jw_1760109025
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

This allows QObject to be converted to other formats, for example
JSON via serde_json.

This is not too useful, since QObjects are consumed by
C code or deserialized into structs, but it can be used for testing
and it is part of the full implementation of a serde format.

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.lock                    |  1 +
 rust/util/Cargo.toml               |  1 +
 rust/util/meson.build              |  3 +-
 rust/util/src/qobject/mod.rs       |  4 +-
 rust/util/src/qobject/serialize.rs | 59 ++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 rust/util/src/qobject/serialize.rs

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index 11085133490..7c9f85d5728 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -445,6 +445,7 @@ dependencies = [
  "foreign",
  "glib-sys",
  "libc",
+ "serde",
 ]
 
 [[package]]
diff --git a/rust/util/Cargo.toml b/rust/util/Cargo.toml
index 85f91436545..554004816eb 100644
--- a/rust/util/Cargo.toml
+++ b/rust/util/Cargo.toml
@@ -17,6 +17,7 @@ anyhow = { workspace = true }
 foreign = { workspace = true }
 glib-sys = { workspace = true }
 libc = { workspace = true }
+serde = { workspace = true }
 common = { path = "../common" }
 
 [lints]
diff --git a/rust/util/meson.build b/rust/util/meson.build
index ce468ea5227..9fafaf76a37 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -39,10 +39,11 @@ _util_rs = static_library(
     {'.': _util_bindings_inc_rs,
     'qobject': [
       'src/qobject/mod.rs',
+      'src/qobject/serialize.rs',
     ]}),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
-  dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, qom, qemuutil],
+  dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, serde_rs, qom, qemuutil],
 )
 
 util_rs = declare_dependency(link_with: [_util_rs])
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index 9c6f168d6e1..0913fabc1ee 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -6,6 +6,8 @@
 
 #![deny(clippy::unwrap_used)]
 
+mod serialize;
+
 use std::{
     cell::UnsafeCell,
     ffi::{c_char, CString},
@@ -230,7 +232,6 @@ fn drop(&mut self) {
     }
 }
 
-#[allow(unused)]
 macro_rules! match_qobject {
     (@internal ($qobj:expr) =>
         $(() => $unit:expr,)?
@@ -313,5 +314,4 @@ macro_rules! match_qobject {
                 $($type $(($val))? => $code,)+)
     };
 }
-#[allow(unused_imports)]
 use match_qobject;
diff --git a/rust/util/src/qobject/serialize.rs b/rust/util/src/qobject/serialize.rs
new file mode 100644
index 00000000000..34ec3847c1d
--- /dev/null
+++ b/rust/util/src/qobject/serialize.rs
@@ -0,0 +1,59 @@
+//! `QObject` serialization
+//!
+//! This module implements the [`Serialize`] trait for `QObject`,
+//! allowing it to be converted to other formats, for example
+//! JSON.
+
+use std::{ffi::CStr, mem::ManuallyDrop, ptr::addr_of};
+
+use serde::ser::{self, Serialize, SerializeMap, SerializeSeq};
+
+use super::{match_qobject, QObject};
+use crate::bindings;
+
+impl Serialize for QObject {
+    #[inline]
+    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
+    where
+        S: ::serde::Serializer,
+    {
+        match_qobject! { (self) =>
+            () => serializer.serialize_unit(),
+            bool(b) => serializer.serialize_bool(b),
+            i64(i) => serializer.serialize_i64(i),
+            u64(u) => serializer.serialize_u64(u),
+            f64(f) => serializer.serialize_f64(f),
+            CStr(cstr) => cstr.to_str().map_or_else(
+                |_| Err(ser::Error::custom("invalid UTF-8 in QString")),
+                |s| serializer.serialize_str(s),
+            ),
+            QList(l) => {
+                let mut node_ptr = unsafe { l.head.tqh_first };
+                let mut state = serializer.serialize_seq(None)?;
+                while !node_ptr.is_null() {
+                    let node = unsafe { &*node_ptr };
+                    let elem = unsafe { ManuallyDrop::new(QObject::from_raw(addr_of!(*node.value))) };
+                    state.serialize_element(&*elem)?;
+                    node_ptr = unsafe { node.next.tqe_next };
+                }
+                state.end()
+            },
+            QDict(d) => {
+                let mut state = serializer.serialize_map(Some(d.size))?;
+                let mut e_ptr = unsafe { bindings::qdict_first(d) };
+                while !e_ptr.is_null() {
+                    let e = unsafe { &*e_ptr };
+                    let key = unsafe { CStr::from_ptr(e.key) };
+                    key.to_str().map_or_else(
+                        |_| Err(ser::Error::custom("invalid UTF-8 in key")),
+                        |k| state.serialize_key(k),
+                    )?;
+                    let value = unsafe { ManuallyDrop::new(QObject::from_raw(addr_of!(*e.value))) };
+                    state.serialize_value(&*value)?;
+                    e_ptr = unsafe { bindings::qdict_next(d, e) };
+                }
+                state.end()
+            }
+        }
+    }
+}
-- 
2.51.0


