Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61011D185F1
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:13:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpn8-0007Yy-If; Thu, 08 Jan 2026 08:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpn7-0007Ya-Gb
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpn5-0007zQ-Ib
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUVnHGR4WXXh17z+7zB0yfXoO4945f0W6/gfPFC9GIg=;
 b=MP9OmlAeLTc/D//1+kgkF8ksml0JDmbR0sBrs1QwjlaKRjTNZaxlc9V+Pz40NyqVhjyvLv
 xtMLda+yrq23xfadiTXGFM1RpydPbPnhkCLlYsi74307GRDiqNJmVRt/0PwUWNiXd6c0wi
 wMLB2awMHcIy11ZcbxqCtkKrbQ2zgfY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-yD546ZtYM6iFJTUmfsD1AA-1; Thu, 08 Jan 2026 08:11:01 -0500
X-MC-Unique: yD546ZtYM6iFJTUmfsD1AA-1
X-Mimecast-MFC-AGG-ID: yD546ZtYM6iFJTUmfsD1AA_1767877861
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso35632055e9.2
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877860; x=1768482660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JUVnHGR4WXXh17z+7zB0yfXoO4945f0W6/gfPFC9GIg=;
 b=DxFKeVV8OQTLMnBdTMPfkqpd7GBX1rCvMzLgQ6zsR0NE+rAiGmA2ZFajcsLNsr136u
 OMSug1PZj1t9sT/REsf5qJ3k1XOFduVyJLsb/2tH7Wy5tQ2fsTLqSUZA4fW8YBlxWqSC
 HplrH1cQYorm9i3UjYeFFTXkGVmFdXAoiCQpSBzyU0CGS2mRNkKYBDQ6Obr0TT+nyYId
 wcuw5Laz7VrQKxM3Kd2uKDHd6uCmlOP/EqFQyBqIddBM+KCJbORaxn9Yms9Z18Aze5BM
 4EHlXVcPMP188RW7bhj1RDb1kWfso+q0i4Qv9HAKEJFLKgDizJbVBHI7AE28+YEsNh7e
 YPYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5ENB/AvEm4QOG9gdOVDuyb4Sa5FtthQ0Lu8S1DwKy36FDsgSf1C+WnNDw9wcnk14IPeLTsZkenyI=@nongnu.org
X-Gm-Message-State: AOJu0Yy4VaLUe+1/xb5YlrZhG+AKWtv2Fl36Uwwn/4j8Q0tZh6+4Egh5
 rCGKRI9c8mINof6Gb1NfrWbN0ZmLXFJZXJftWdZYTz2WmzEp2J3i29bVe5TNIWBy+v1og9sQJpc
 l8PT6u6r+kipZGt790G9Hd9nvOc1hDjYqfXSNCv00/mwNG7cn2tJBV1Q=
X-Gm-Gg: AY/fxX4ivCNREnT6AqeYjEXkCc8djlsywleZR6wFu3OSiIjJQCXfvVD9V80kR8AVZyg
 V89T/s6QmZotMi/sA83Vy0yMQJTBAvqYii5Q0xDb3y62Y3vGnSQwme9X23zEqneCtk/TfvtoGbM
 P+l8s9d0oV/lPTaDGXEir62U4D0AqnlVcqSDlKZ9stOUI/XAOY+QnsAUKWAxrVR4//JayjCtNl3
 Jrx8T1G6kAHsmmxArA+FZlsfknTQdCRx4KPgjIGAaWL5WFgpM502rgG0ItsfRzjJ/TUBLClKdsX
 wvdrW8NsPF0Ut9T7O2mRN5Du5AjBGo3RpkfSbiXT7tiEcLbyAbzRP++sgmTVi9wjjEb2iaQYIyN
 +yHfqluG4hLuaq7IdwAjB/wv07antbp5fq2mA/BH/OQi9CCBBF84BhPn7Aabco8w2BlqUwwPnD2
 69a+piUqWKR3a8HA==
X-Received: by 2002:a05:6000:2311:b0:42f:b707:56dd with SMTP id
 ffacd0b85a97d-432c37c878bmr8054234f8f.33.1767877860402; 
 Thu, 08 Jan 2026 05:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuepepjI/T31qaZs/s9jAakQ0H5Cxp4VxpWUG1QPLKG0DFtNRa1vnCXidolxpt29rZB0GTeQ==
X-Received: by 2002:a05:6000:2311:b0:42f:b707:56dd with SMTP id
 ffacd0b85a97d-432c37c878bmr8054210f8f.33.1767877859960; 
 Thu, 08 Jan 2026 05:10:59 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5dfa07sm16274775f8f.25.2026.01.08.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:10:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 05/16] rust/qobject: add Deserialize implementation
Date: Thu,  8 Jan 2026 14:10:32 +0100
Message-ID: <20260108131043.490084-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ahwfJsGfClG68sUOP6bA674YHnR6KDG1GF397xXemQc_1767877861
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

This allows QObject to be created from any serializable format, for
example JSON via serde_json.

This is not too useful, since QObjects are produced by
C code or by serializing structs, but it can be used for testing
and it is part of the full implementation of a serde format.

It is relatively simple and similar to the Serializer, just with
the extra indirection of a Visitor.

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/meson.build                |   1 +
 rust/util/src/qobject/deserialize.rs | 134 +++++++++++++++++++++++++++
 rust/util/src/qobject/mod.rs         |   1 +
 3 files changed, 136 insertions(+)
 create mode 100644 rust/util/src/qobject/deserialize.rs

diff --git a/rust/util/meson.build b/rust/util/meson.build
index 7829364c09a..4621932fdcb 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -40,6 +40,7 @@ _util_rs = static_library(
     {'.': _util_bindings_inc_rs,
     'qobject': [
       'src/qobject/mod.rs',
+      'src/qobject/deserialize.rs',
       'src/qobject/error.rs',
       'src/qobject/serializer.rs',
       'src/qobject/serialize.rs',
diff --git a/rust/util/src/qobject/deserialize.rs b/rust/util/src/qobject/deserialize.rs
new file mode 100644
index 00000000000..280a577b6be
--- /dev/null
+++ b/rust/util/src/qobject/deserialize.rs
@@ -0,0 +1,134 @@
+//! `QObject` deserialization
+//!
+//! This module implements the [`Deserialize`] trait for `QObject`,
+//! allowing it to be created from any serializable format, for
+//! example JSON.
+
+use core::fmt;
+use std::ffi::CString;
+
+use serde::de::{self, Deserialize, MapAccess, SeqAccess, Visitor};
+
+use super::{to_qobject, QObject};
+
+impl<'de> Deserialize<'de> for QObject {
+    #[inline]
+    fn deserialize<D>(deserializer: D) -> Result<QObject, D::Error>
+    where
+        D: serde::Deserializer<'de>,
+    {
+        struct ValueVisitor;
+
+        impl<'de> Visitor<'de> for ValueVisitor {
+            type Value = QObject;
+
+            fn expecting(&self, formatter: &mut fmt::Formatter) -> fmt::Result {
+                formatter.write_str("any valid JSON value")
+            }
+
+            #[inline]
+            fn visit_bool<E>(self, value: bool) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            #[inline]
+            fn visit_i64<E>(self, value: i64) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            fn visit_i128<E>(self, value: i128) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                to_qobject(value).map_err(|_| de::Error::custom("number out of range"))
+            }
+
+            #[inline]
+            fn visit_u64<E>(self, value: u64) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            fn visit_u128<E>(self, value: u128) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                to_qobject(value).map_err(|_| de::Error::custom("number out of range"))
+            }
+
+            #[inline]
+            fn visit_f64<E>(self, value: f64) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            #[inline]
+            fn visit_str<E>(self, value: &str) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                CString::new(value)
+                    .map_err(|_| de::Error::custom("NUL character in string"))
+                    .map(QObject::from)
+            }
+
+            #[inline]
+            fn visit_string<E>(self, value: String) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                CString::new(value)
+                    .map_err(|_| de::Error::custom("NUL character in string"))
+                    .map(QObject::from)
+            }
+
+            #[inline]
+            fn visit_none<E>(self) -> Result<QObject, E> {
+                Ok(().into())
+            }
+
+            #[inline]
+            fn visit_some<D>(self, deserializer: D) -> Result<QObject, D::Error>
+            where
+                D: serde::Deserializer<'de>,
+            {
+                Deserialize::deserialize(deserializer)
+            }
+
+            #[inline]
+            fn visit_unit<E>(self) -> Result<QObject, E> {
+                Ok(().into())
+            }
+
+            #[inline]
+            fn visit_seq<V>(self, mut visitor: V) -> Result<QObject, V::Error>
+            where
+                V: SeqAccess<'de>,
+            {
+                // TODO: insert elements one at a time
+                let mut vec = Vec::<QObject>::new();
+
+                while let Some(elem) = visitor.next_element()? {
+                    vec.push(elem);
+                }
+                Ok(QObject::from_iter(vec))
+            }
+
+            fn visit_map<V>(self, mut visitor: V) -> Result<QObject, V::Error>
+            where
+                V: MapAccess<'de>,
+            {
+                // TODO: insert elements one at a time
+                let mut vec = Vec::<(CString, QObject)>::new();
+
+                if let Some(first_key) = visitor.next_key()? {
+                    vec.push((first_key, visitor.next_value()?));
+                    while let Some((key, value)) = visitor.next_entry()? {
+                        vec.push((key, value));
+                    }
+                }
+                Ok(QObject::from_iter(vec))
+            }
+        }
+
+        deserializer.deserialize_any(ValueVisitor)
+    }
+}
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index bfa3e9e34bb..c0c16f28049 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -6,6 +6,7 @@
 
 #![deny(clippy::unwrap_used)]
 
+mod deserialize;
 mod error;
 mod serialize;
 mod serializer;
-- 
2.52.0


