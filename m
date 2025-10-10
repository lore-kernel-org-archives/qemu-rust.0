Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E9ACCD18A
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:13:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Els-0000Ec-Pr; Fri, 10 Oct 2025 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Elq-0000BN-Q4
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7ElQ-00047R-Ia
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCPK7I5rXb+g55P6MWyJcXND3mxADuY6GKf7ZyxSOeg=;
 b=gLaBcadfckZxH7v9XdiUO3h+S/bk+IYXnIdywWfk3TZUNeezp5fecytN1D0iRKvzkzrjbI
 I7YHl60yAGEoVsUMqAX2SxJdbuKL9Rn0YMJ0tFncDzpij00wTdjojAaMkxKRIAr3lg3Zck
 65Egk6ztSl16KGJBvAMXijqORa38bSw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-hnT7hRXKO0afqkhe-12ncA-1; Fri, 10 Oct 2025 11:10:30 -0400
X-MC-Unique: hnT7hRXKO0afqkhe-12ncA-1
X-Mimecast-MFC-AGG-ID: hnT7hRXKO0afqkhe-12ncA_1760109029
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b448c864d45so203758966b.2
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109028; x=1760713828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCPK7I5rXb+g55P6MWyJcXND3mxADuY6GKf7ZyxSOeg=;
 b=sPDVPKo/VNZkRltI0m6Ohg+4bb7t8sb1ih0KjWhwCIKaZBVYMeSGsT9dnaC3/ZuP6E
 NzAYOf81k7BoDeumXNxonkbT1nFSfU71FVwRfiltfvt1imsyf7k+bVmMI96vlg/sfu9H
 4QQxnvFXTgv2dRxiqCc1Fwmkhm7RkRHZ9VZdTlMeXhm6ouK/EB32tNOSxf4vvC8M1FdI
 X0uvKfXn7MEe+yFkAsUSF3rsV3L+3iq2T+seYTfwjZxf/D5fy3B/XfSZuTFmjKWLWuJN
 rZ+nU2l3CCFcqHgAeLnaZ3bPxfFZ4Q082ij0/howIvKqVzuxMJa2I7CB773gskr1Nzzf
 VCww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5JmGOeohe9mjEd1J+j75pcf3f8G2g3rbAQX3M+d+1aXNmPTN/v/nHXmz2PG+OcOVhY6thcqhWNBc=@nongnu.org
X-Gm-Message-State: AOJu0Yyhw6YTTgmqsje3ZVHCVrhH7H0NzchFFgUadzne3fayS9s/JU+L
 WTBc/eFNCpYvYrX0c18bpjAkCBBcvJwEj/DFrYuI7TGYAv4ZwQwKAg4P/AnFgIWEJ2VnWC7hDqU
 3ulsduy50yxBBOlCViP9UA+5JFqLHR5cmSnwU0q5+XPgXckUyH1eM4VDuNP4/svQ=
X-Gm-Gg: ASbGncsDIXxPCAMKiNNomkD/Hpgx34dmo/Aoh4bO4IAmjFGdPzaO9Sy6cCAWuFS1OZ7
 UM8m3W8UaFmNJaPLn5/PLdPIYka5UGnhK2ZZNzijHgQHpAdBSS2cHm5iJY/M3uGE9UsHrMcGayU
 hQ0bsPJ9KG2SDWrZhJN1PlS/Ud0k1FKnmsNrwmLgzd37FzBIG9lY98FQAyZK1iBxXW1pbtI/Svf
 MV5RWXjPb/QepjvTgLsvl6cSLIK+FHRwdEkMSTyAT0qJEG/0ujLTq9rIUum0CUx98blTo8FUCkf
 Dqpw/Mhn1j0Ldry2jMicOd71A7iPqn7OpGjoWIl9AviEaUWBpnf0m8uj9/Ftp6aQrxOJiZoEsAC
 xov7yBYJBBmU6ASsbJkgeAqzHQ7jDipGNOgB/xkTwM7T7
X-Received: by 2002:a17:907:72cf:b0:b40:b6a9:f704 with SMTP id
 a640c23a62f3a-b50a9b61d94mr1243688866b.7.1760109028370; 
 Fri, 10 Oct 2025 08:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHf+1tcAvT0bKtrZRDdvEXrXpXVQEPTz2o++Knf/KHNtenmJTOLop/xvRtQ/OliP7ciJSd0A==
X-Received: by 2002:a17:907:72cf:b0:b40:b6a9:f704 with SMTP id
 a640c23a62f3a-b50a9b61d94mr1243685666b.7.1760109027938; 
 Fri, 10 Oct 2025 08:10:27 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12b62sm253141466b.48.2025.10.10.08.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 08/19] rust/qobject: add Deserialize implementation
Date: Fri, 10 Oct 2025 17:09:53 +0200
Message-ID: <20251010151006.791038-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tXbieX4NEJ5KQ3QV4MpZ9g-iswzvP81AxzLL2FP7qMA_1760109029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/meson.build                |   1 +
 rust/util/src/qobject/deserialize.rs | 134 +++++++++++++++++++++++++++
 rust/util/src/qobject/mod.rs         |   1 +
 3 files changed, 136 insertions(+)
 create mode 100644 rust/util/src/qobject/deserialize.rs

diff --git a/rust/util/meson.build b/rust/util/meson.build
index 39f427b3456..9f8fbd49f00 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -39,6 +39,7 @@ _util_rs = static_library(
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
index f8bd195ca2b..80c496b8a63 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -6,6 +6,7 @@
 
 #![deny(clippy::unwrap_used)]
 
+mod deserialize;
 mod error;
 mod serialize;
 mod serializer;
-- 
2.51.0


