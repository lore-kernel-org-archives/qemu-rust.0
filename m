Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30226CCA474
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:02:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmV-0005nC-G5; Wed, 01 Oct 2025 04:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmL-0005in-I1
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rlz-00063Q-6V
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esRzxxhSezsp5v+ipGZzn6zfceiaFhI4xODHPTjgqx4=;
 b=ZfeOsctfDcg1Uxx+kVwt3lkbvByFe2m/NA18Rm3V1buAfLhHHHZb+NN908PltUThFWSWJ+
 a79dwGZiLi6iag/fmnlxP/TdPoef7X0P8q5GQ0L4GGiXBKp7rI5ptklwBMIouubKh1hiJn
 GT4Sm5DHNLz2ljLD13BrOVQKycKY1IE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-12a8LV7PPjSuAsdmiemQgQ-1; Wed, 01 Oct 2025 04:01:12 -0400
X-MC-Unique: 12a8LV7PPjSuAsdmiemQgQ-1
X-Mimecast-MFC-AGG-ID: 12a8LV7PPjSuAsdmiemQgQ_1759305671
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b3c72638b5dso389349066b.3
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305670; x=1759910470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=esRzxxhSezsp5v+ipGZzn6zfceiaFhI4xODHPTjgqx4=;
 b=KvgFbj2R9+ID4DkkxWTowoGyp8NDs9zPYng5fICnxtmY0Wnxq7k95OkRzXH+++psCt
 CkcKAOPVEnQt8nTHDIWbyPYr0SP3xK6nmQ2A2oLmYpi+Kwb2a+WJIMM9BWjQls3FCZAL
 FN4afxzqW5BWH7YJ+4pMrcWE+Tr5PstvO9rHH/BxQoL6yvTN5oW19YjYZMHBDxt2OBr4
 kygSCPMHPD91Wn1jFqVrB31alE4kS7pV3O75m7E6CzOCSN9tQEeA9yzOeg59t/FsSFiU
 DM1kG7RX1MI5mpPEI7dgyUS/zSnntHUpiLNXFK+x3sY9rvX4ltgP8Pk3NN5S8VlDn3qe
 Dm0A==
X-Gm-Message-State: AOJu0Yz69TlRAImyHCvlki5rza5qX6pJ1v9FtfobckX5axKTO/+OYXtL
 HjiFsbxMAvejaLr9cODNQN9HgDsCauVAkiHa+gTiwSg1LWjWfwEEVU4WIqT94yiBtY4aF68ped3
 7Uw/4AhFv2bKkdmNphDynS2Ob1FTJ9Kk9ZNTvurL44gHwrTXukBkfNoI=
X-Gm-Gg: ASbGncvIr33jMhlWW+CzkqQxnlWw6Z8rxXHcyaGrtVQReOxIe1d7y0EpJU16wiHy49z
 17zdqJJKGezIGl/9AvaAmHne+qxBnSLL7wCyO2YpIld6EKrV62pNqbyUxTDGbwz+8kKURa/7qm8
 /TRUM395zROXfQFFy6E9r17M+O4gB9h9Qe9unK4+XFYF2/8i/oVmNjOxWgEqjt94i6i0KfSaE+u
 B2ZOVVgjMjAlSClqUnDLAgXhuVBGr471SpcuZFao07rzKip5H0fDPLxw9xdkCDAAZqxpPxi5ZQi
 Ovrmcl4Wz+MViAnRxIz869VAHqWVyof1iMC6/0eFGix2Dm6CoZTWlASUHA5I4wZkclmASrTIzyH
 gjzKWFTBn08rEAATRcTMyq6dmj2+k3u+v29vHz/P8eLQYHlpU80Y=
X-Received: by 2002:a17:907:9622:b0:b42:e3fb:c950 with SMTP id
 a640c23a62f3a-b46e612bedbmr289812666b.42.1759305668904; 
 Wed, 01 Oct 2025 01:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZBTqg/KtMOZrkRKPJoUhfr3DUgvhZxF0lCi42VDSFp1asC2CdHTVmXPMXbCnBe9fVwNEKkA==
X-Received: by 2002:a17:907:9622:b0:b42:e3fb:c950 with SMTP id
 a640c23a62f3a-b46e612bedbmr289796966b.42.1759305666903; 
 Wed, 01 Oct 2025 01:01:06 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d2801992csm696877966b.16.2025.10.01.01.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 06/14] rust: add Deserialize implementation for QObject
Date: Wed,  1 Oct 2025 10:00:43 +0200
Message-ID: <20251001080051.1043944-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mruny6dAQ67JhQXbfOTu2XiHwlOemhkaq5Gu6lyuLeM_1759305671
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index fb152766003..2b72af99dd5 100644
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
index cd034185748..aec635a5ccc 100644
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


