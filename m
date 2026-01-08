Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DACD185F1
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:11:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpn2-0007XQ-IY; Thu, 08 Jan 2026 08:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpn1-0007WN-2M
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:10:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpmz-0007yM-8o
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqCrVvUX1EXb2s0loBz213vZBI1pR55uJOq0h9TgEQM=;
 b=FJFQhFHEZoMB0C0BqEUBkmDMAsk2goHUyjw4t4pRGi7pxlh+vaHdxc82WeZQxgpwXBIYYL
 CyzaR/wXuyFU6Xl8q0IzFlCLsSvKcSwT2Iv+LZS7GWSGOi0fJJIvyYPbcaZuL5IedBEBmN
 oJ0hsT2TozWDufNAOR/ovPPIuY7l9n0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-cu4i9APBOza0kiXgBOFPPw-1; Thu, 08 Jan 2026 08:10:55 -0500
X-MC-Unique: cu4i9APBOza0kiXgBOFPPw-1
X-Mimecast-MFC-AGG-ID: cu4i9APBOza0kiXgBOFPPw_1767877854
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d5c7a2f5dso26541445e9.2
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877854; x=1768482654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UqCrVvUX1EXb2s0loBz213vZBI1pR55uJOq0h9TgEQM=;
 b=uY/5ep4XppuVsNqeFxfAOqf7YDhF7dJSCemcU7ilz9Mjqrckf3w7/k31aKXxC7khqj
 HYFlUzXAcTMcg+othCDCAOYnutI07x9JxLy7Ews7iq/CqRVzMfllyrSSBwuKIGVLo8DR
 FKaBWk2E+dpY6Fmw4Uj2eTV1C9jlRHNc8B+AKbviltJ+OYfvxlWc10DGhr4r8cw5yt0B
 OU6Xqtw3ED/ESh+9OKUsYVM7X5KaeM+1a64Dy3NUCsnTBa/pcCz2fniNnNWoRGzQApCN
 dv5HLId6uwavFmB7S3jCVVuZQLbW6NbqWHkvIAqkdGnbzvgmU/BWEo+nD3YYhDOxk9F/
 uMsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK06TiZ995wPCekh7zLRApdVE8gw8z5TyZfAnldBSbG1sm/OAyNxfKLkeOTS1bfdqn26zeGAw9POs=@nongnu.org
X-Gm-Message-State: AOJu0YxqTtt0yLuy52+AF2HrL+/vIO/V0n8+JCOSNeXxTRlU8vq7FgrI
 kKMk5Hd2pneJacDTN2pFSh7y6lpjOoHes12KJDfdc9Rdodsb/gDDyCVyGsKEOfejtegipQNuUZL
 rGGTB+stEqBiFVGxbVPgOfcOUZg2Am8jFDbZCiHt6MEnbYW8bVp6yjJAWH1XeJWM=
X-Gm-Gg: AY/fxX6Wp09bNo4jWe46poutTTI8Mc2+VzWkYtcnXH3AXiCmU4IDw7rM45eQL2EnPLj
 qiHIuLFnxEdOy7jj2DC95SA98Pszz+tp90+5NsIhQ+hDjP9/ahNt1blazsGDVYxaguKl85Vw6zN
 A5YlGOGbNIWcDGAFYHOKlGM15R89G6Pwbpy8XvLcUEuNVISx7WHFdjC7k8YwjSlvjnIPy666lAJ
 G6XUTRQEq6kxTLvf0zhJggWPFYgq4klaFRHuenEr0svXN1Fc3OU3rxpOztUF1XGoj2BzSFwtMYT
 c10QlPFi/AUPpfWho4vCoc50TsFCU0Nc6iWd75GpH6h0l7BzIUJYkmGDtHDCItGcP7g5sVDnNuh
 ttZhUaJjOX80ulNnTAagGPSflV8XElCN+h9iq/ZNxjaA45gDtIS/x4h5F/J386RpsTLa0TQdPY3
 XWdilXn+KGCSSqHA==
X-Received: by 2002:a05:600c:4e49:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-47d84b172bcmr73726805e9.11.1767877853965; 
 Thu, 08 Jan 2026 05:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw4iQ0MovB5pjL581zvBOb6KCYC+7Qdo6ESflVbfDkVmmWAPAC8XTWbr5jesFGfAiDcesXQg==
X-Received: by 2002:a05:600c:4e49:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-47d84b172bcmr73726575e9.11.1767877853571; 
 Thu, 08 Jan 2026 05:10:53 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8384646fsm118655955e9.15.2026.01.08.05.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:10:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 03/16] rust/qobject: add Serialize implementation
Date: Thu,  8 Jan 2026 14:10:30 +0100
Message-ID: <20260108131043.490084-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TnNiC1Hy2CkW9dvY58pfEaLMws2G6W73tnHQdbyTbyQ_1767877854
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
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
index 42ae857fe53..b6c9f934140 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -453,6 +453,7 @@ dependencies = [
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
index 28593286134..166a792bce7 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -40,8 +40,9 @@ _util_rs = static_library(
     {'.': _util_bindings_inc_rs,
     'qobject': [
       'src/qobject/mod.rs',
+      'src/qobject/serialize.rs',
     ]}),
-  dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs],
+  dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, serde_rs],
 )
 
 util_rs = declare_dependency(link_with: [_util_rs], dependencies: [qemuutil, qom])
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index 5744870ad1c..7b9f0516fe1 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -6,6 +6,8 @@
 
 #![deny(clippy::unwrap_used)]
 
+mod serialize;
+
 use std::{
     cell::UnsafeCell,
     ffi::{c_char, CString},
@@ -244,7 +246,6 @@ fn drop(&mut self) {
     }
 }
 
-#[allow(unused)]
 macro_rules! match_qobject {
     (@internal ($qobj:expr) =>
         $(() => $unit:expr,)?
@@ -327,5 +328,4 @@ macro_rules! match_qobject {
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
2.52.0


