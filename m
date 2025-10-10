Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF80CCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:18:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Elr-0000BO-Qi; Fri, 10 Oct 2025 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Elp-0000A3-9w
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7ElQ-00047f-Ns
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXiTTUbNHDbzCZW92MIQx4Ti2Mz3wQylh/TTI5lqmoM=;
 b=K+Lg615v3sdMEFAtANDSvCe/3m4Bq6r39oAwOD/4LBlvKMPoU5Cz6AhiuQwC9TLMy9L+hf
 wJM3N4gM5f2GX4NqP01Raj+7ygaIZF10oefC9oQnmtu3gOXq8FpfhzVtzDxIYgopuZ3+Ek
 8f06Z8oUCZ4o42hNQNVBk5UE9/JdLG8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-53Kp670oOrCJmnFu-Thy_A-1; Fri, 10 Oct 2025 11:10:32 -0400
X-MC-Unique: 53Kp670oOrCJmnFu-Thy_A-1
X-Mimecast-MFC-AGG-ID: 53Kp670oOrCJmnFu-Thy_A_1760109031
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b07c2924d53so233938766b.3
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109031; x=1760713831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXiTTUbNHDbzCZW92MIQx4Ti2Mz3wQylh/TTI5lqmoM=;
 b=f2zFi0eih9MC2IoinuVFMP4dfK/nvSgluW2nzsrSEXcJOyAvLxJ3Cu7k7rsfCUTJ3+
 vOH/Ly2KpZMnUZ6NhRAbiQuM1DAVNpoJJ1Muod2XOZITqaSNG8vLa9fvVziJmnl1FrEq
 lo2Wndg3x2efe7wu1mmNU3FXZ0nhNHGt0UAwjNiXyBaq+7Uv+akaPfX1B910OfAhhRq1
 wKg5R/uPzaN7HgI2anoQz5MeKQZ64uBbzjqEn3HpQRZf0oEl94fczAXMbR0JqeAAKStM
 ehXWf21L78/tjnDayg7xkoVkxr3j73AefYa2cLxTgy2xPoURuOYaLaoGOtJxVh0pjk4T
 10DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSc7ndnxdiAmzedRhDN3Im1ATyujy6Rv0M3AbHxJLNLsMXuvsE6mv0QnTRkKt6IaU2u1d1qcrk1GA=@nongnu.org
X-Gm-Message-State: AOJu0YwQfpjH/x7jTw7Akaf9kiZH3Ou9V8oOGA/0u8Mdfq6jjVoSPH3z
 0lOtHA/DNRBjoAGaehZeNqBQ3lry5FWjKRuilEFcphXoZMBvVEjoNIQII7SfSczxvAEFUJhF7gF
 giG99Drl2/Ebnv9w3cy9Mjt1C71bYQlteS2TyoQgsxoUqNKJdRdCsU9c=
X-Gm-Gg: ASbGncs0n8PrvjGukXDdW+hqfggs3kbP2XHqvkdLVivNTigfP64kOWw9xfZFng+kS4b
 JVXQBi3bU7V8rkyCAFlVKbfksAWm0+lb+RmtjZ3PSQZ9tmFTU8wQAu8vhTEkLruZvFcu9LOU6et
 yZ9UIBn+DWwSpivoKI9QRCmhMq3XZOYMQtOkuEMdpN3z2lzQrjyKuNtsUIgS2I4a3dY9I4tRkvN
 9Uy65HsIx0bAsxmL2u3Eq8Qxomc4Wvmzk7gzimdIZhziQXLgVSeE0AwgokUsY3GvHES1ErEyyBZ
 8RpGz0KJWkkjPoSP0oeFYeuYoj/Go7YggEyZ3ZBbopzAKDXIIXDU5aElnpMkpGG9zltTHJ2lcsl
 /TWtWR1ZU3ecWyNP6dvb+66GVj723XIDcSmaf50gaBEuf
X-Received: by 2002:a17:906:c10f:b0:b3c:f0a4:b324 with SMTP id
 a640c23a62f3a-b50aaa9fe39mr1191001666b.21.1760109030587; 
 Fri, 10 Oct 2025 08:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaT6YihrPLKX768RhgQzNMhDp+ObmC/dt7GsizT9K8qPSVfMTMpLjiAuWRXiQePn/74olbCA==
X-Received: by 2002:a17:906:c10f:b0:b3c:f0a4:b324 with SMTP id
 a640c23a62f3a-b50aaa9fe39mr1190998766b.21.1760109030103; 
 Fri, 10 Oct 2025 08:10:30 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12a62sm257055966b.58.2025.10.10.08.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 09/19] rust/qobject: add Deserializer (from_qobject)
 implementation
Date: Fri, 10 Oct 2025 17:09:54 +0200
Message-ID: <20251010151006.791038-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kfye73BRtkN_PTfi6HplvO29Dv4HyTqGWVAye_B5t50_1760109031
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This allows creating any serializable data structure from QObject.
The purpose of all the code is to typecheck each variant in the
serde data model and check that it's one of the corresponding
QObject data types.

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst                   |   1 +
 rust/util/meson.build                 |   1 +
 rust/util/src/qobject/deserializer.rs | 371 ++++++++++++++++++++++++++
 rust/util/src/qobject/error.rs        |   8 +-
 rust/util/src/qobject/mod.rs          |   2 +
 5 files changed, 382 insertions(+), 1 deletion(-)
 create mode 100644 rust/util/src/qobject/deserializer.rs

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 2f0ab2e2821..3aadfb78dfd 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -161,6 +161,7 @@ module                     status
 ``util::error``            stable
 ``util::log``              proof of concept
 ``util::module``           complete
+``util::qobject``          stable
 ``util::timer``            stable
 ========================== ======================
 
diff --git a/rust/util/meson.build b/rust/util/meson.build
index 9f8fbd49f00..aff14a41589 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -39,6 +39,7 @@ _util_rs = static_library(
     {'.': _util_bindings_inc_rs,
     'qobject': [
       'src/qobject/mod.rs',
+      'src/qobject/deserializer.rs',
       'src/qobject/deserialize.rs',
       'src/qobject/error.rs',
       'src/qobject/serializer.rs',
diff --git a/rust/util/src/qobject/deserializer.rs b/rust/util/src/qobject/deserializer.rs
new file mode 100644
index 00000000000..84a03bd9f1b
--- /dev/null
+++ b/rust/util/src/qobject/deserializer.rs
@@ -0,0 +1,371 @@
+//! `QObject` deserializer
+//!
+//! This module implements a [`Deserializer`](serde::de::Deserializer) that
+//! produces `QObject`s, allowing them to be turned into deserializable data
+//! structures (such as primitive data types, or structs that implement
+//! `Deserialize`).
+
+use std::ffi::CStr;
+
+use serde::de::{
+    self, value::StrDeserializer, DeserializeSeed, Expected, IntoDeserializer, MapAccess,
+    SeqAccess, Unexpected, Visitor,
+};
+
+use super::{
+    error::{Error, Result},
+    match_qobject, QObject,
+};
+use crate::bindings;
+
+impl QObject {
+    #[cold]
+    fn invalid_type<E>(&self, exp: &dyn Expected) -> E
+    where
+        E: serde::de::Error,
+    {
+        serde::de::Error::invalid_type(self.unexpected(), exp)
+    }
+
+    #[cold]
+    fn unexpected(&self) -> Unexpected<'_> {
+        match_qobject! { (self) =>
+            () => Unexpected::Unit,
+            bool(b) => Unexpected::Bool(b),
+            i64(n) => Unexpected::Signed(n),
+            u64(n) => Unexpected::Unsigned(n),
+            f64(n) => Unexpected::Float(n),
+            CStr(s) => s.to_str().map_or_else(
+                |_| Unexpected::Other("string with invalid UTF-8"),
+                Unexpected::Str),
+            QList(_) => Unexpected::Seq,
+            QDict(_) => Unexpected::Map,
+        }
+    }
+}
+
+fn visit_qlist_ref<'de, V>(qlist: &'de bindings::QList, visitor: V) -> Result<V::Value>
+where
+    V: Visitor<'de>,
+{
+    struct QListDeserializer(*mut bindings::QListEntry, usize);
+
+    impl<'de> SeqAccess<'de> for QListDeserializer {
+        type Error = Error;
+
+        fn next_element_seed<T>(&mut self, seed: T) -> Result<Option<T::Value>>
+        where
+            T: DeserializeSeed<'de>,
+        {
+            if self.0.is_null() {
+                return Ok(None);
+            }
+
+            let e = unsafe { &*self.0 };
+            // increment the reference count because deserialize consumes `value`.
+            let value = unsafe { QObject::cloned_from_raw(e.value.cast_const()) };
+            let result = seed.deserialize(value);
+            self.0 = unsafe { e.next.tqe_next };
+            self.1 += 1;
+            result.map(Some)
+        }
+    }
+
+    let mut deserializer = QListDeserializer(unsafe { qlist.head.tqh_first }, 0);
+    let seq = visitor.visit_seq(&mut deserializer)?;
+    if deserializer.0.is_null() {
+        Ok(seq)
+    } else {
+        Err(serde::de::Error::invalid_length(
+            deserializer.1,
+            &"fewer elements in array",
+        ))
+    }
+}
+
+fn visit_qdict_ref<'de, V>(qdict: &'de bindings::QDict, visitor: V) -> Result<V::Value>
+where
+    V: Visitor<'de>,
+{
+    struct QDictDeserializer(*mut bindings::QDict, *const bindings::QDictEntry);
+
+    impl<'de> MapAccess<'de> for QDictDeserializer {
+        type Error = Error;
+
+        fn next_key_seed<T>(&mut self, seed: T) -> Result<Option<T::Value>>
+        where
+            T: DeserializeSeed<'de>,
+        {
+            if self.1.is_null() {
+                return Ok(None);
+            }
+
+            let e = unsafe { &*self.1 };
+            let key = unsafe { CStr::from_ptr(e.key) };
+            let key_de = StrDeserializer::new(key.to_str()?);
+            seed.deserialize(key_de).map(Some)
+        }
+
+        fn next_value_seed<T>(&mut self, seed: T) -> Result<T::Value>
+        where
+            T: DeserializeSeed<'de>,
+        {
+            if self.1.is_null() {
+                panic!("next_key must have returned None");
+            }
+
+            let e = unsafe { &*self.1 };
+            // increment the reference count because deserialize consumes `value`.
+            let value = unsafe { QObject::cloned_from_raw(e.value) };
+            let result = seed.deserialize(value);
+            self.1 = unsafe { bindings::qdict_next(self.0, self.1) };
+            result
+        }
+    }
+
+    let qdict = (qdict as *const bindings::QDict).cast_mut();
+    let e = unsafe { bindings::qdict_first(qdict) };
+    let mut deserializer = QDictDeserializer(qdict, e);
+    let map = visitor.visit_map(&mut deserializer)?;
+    if deserializer.1.is_null() {
+        Ok(map)
+    } else {
+        Err(serde::de::Error::invalid_length(
+            unsafe { bindings::qdict_size(qdict) },
+            &"fewer elements in map",
+        ))
+    }
+}
+
+fn visit_qnum_ref<'de, V>(qnum: QObject, visitor: V) -> Result<V::Value>
+where
+    V: Visitor<'de>,
+{
+    match_qobject! { (qnum) =>
+        i64(n) => visitor.visit_i64(n),
+        u64(n) => visitor.visit_u64(n),
+        f64(n) => visitor.visit_f64(n),
+        _ => Err(qnum.invalid_type(&"number")),
+    }
+}
+
+macro_rules! deserialize_number {
+    ($method:ident) => {
+        fn $method<V>(self, visitor: V) -> Result<V::Value>
+        where
+            V: Visitor<'de>,
+        {
+            visit_qnum_ref(self, visitor)
+        }
+    };
+}
+
+impl<'de> serde::Deserializer<'de> for QObject {
+    type Error = Error;
+
+    fn deserialize_any<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            () => visitor.visit_unit(),
+            bool(v) => visitor.visit_bool(v),
+            i64(n) => visitor.visit_i64(n),
+            u64(n) => visitor.visit_u64(n),
+            f64(n) => visitor.visit_f64(n),
+            CStr(cstr) => visitor.visit_str(cstr.to_str()?),
+            QList(qlist) => visit_qlist_ref(qlist, visitor),
+            QDict(qdict) => visit_qdict_ref(qdict, visitor),
+        }
+    }
+
+    deserialize_number!(deserialize_i8);
+    deserialize_number!(deserialize_i16);
+    deserialize_number!(deserialize_i32);
+    deserialize_number!(deserialize_i64);
+    deserialize_number!(deserialize_i128);
+    deserialize_number!(deserialize_u8);
+    deserialize_number!(deserialize_u16);
+    deserialize_number!(deserialize_u32);
+    deserialize_number!(deserialize_u64);
+    deserialize_number!(deserialize_u128);
+    deserialize_number!(deserialize_f32);
+    deserialize_number!(deserialize_f64);
+
+    fn deserialize_option<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            () => visitor.visit_none(),
+            _ => visitor.visit_some(self),
+        }
+    }
+
+    fn deserialize_enum<V>(
+        self,
+        _name: &'static str,
+        _variants: &'static [&'static str],
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            CStr(cstr) => visitor.visit_enum(cstr.to_str()?.into_deserializer()),
+            _ => Err(self.invalid_type(&"string")),
+        }
+    }
+
+    fn deserialize_newtype_struct<V>(self, _name: &'static str, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_newtype_struct(self)
+    }
+
+    fn deserialize_bool<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            bool(v) => visitor.visit_bool(v),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_char<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_str(visitor)
+    }
+
+    fn deserialize_str<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            CStr(cstr) => visitor.visit_str(cstr.to_str()?),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_string<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_str(visitor)
+    }
+
+    fn deserialize_bytes<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            CStr(cstr) => visitor.visit_str(cstr.to_str()?),
+            QList(qlist) => visit_qlist_ref(qlist, visitor),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_byte_buf<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_bytes(visitor)
+    }
+
+    fn deserialize_unit<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            () => visitor.visit_unit(),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_unit_struct<V>(self, _name: &'static str, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_unit(visitor)
+    }
+
+    fn deserialize_seq<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            QList(qlist) => visit_qlist_ref(qlist, visitor),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_tuple<V>(self, _len: usize, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_seq(visitor)
+    }
+
+    fn deserialize_tuple_struct<V>(
+        self,
+        _name: &'static str,
+        _len: usize,
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_seq(visitor)
+    }
+
+    fn deserialize_map<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            QDict(qdict) => visit_qdict_ref(qdict, visitor),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_struct<V>(
+        self,
+        _name: &'static str,
+        _fields: &'static [&'static str],
+        visitor: V,
+    ) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        match_qobject! { (self) =>
+            QList(qlist) => visit_qlist_ref(qlist, visitor),
+            QDict(qdict) => visit_qdict_ref(qdict, visitor),
+            _ => Err(self.invalid_type(&visitor)),
+        }
+    }
+
+    fn deserialize_identifier<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        self.deserialize_str(visitor)
+    }
+
+    fn deserialize_ignored_any<V>(self, visitor: V) -> Result<V::Value>
+    where
+        V: Visitor<'de>,
+    {
+        visitor.visit_unit()
+    }
+}
+
+pub fn from_qobject<T>(value: QObject) -> Result<T>
+where
+    T: de::DeserializeOwned,
+{
+    T::deserialize(value)
+}
diff --git a/rust/util/src/qobject/error.rs b/rust/util/src/qobject/error.rs
index 5212e65c4f7..2d7c180187a 100644
--- a/rust/util/src/qobject/error.rs
+++ b/rust/util/src/qobject/error.rs
@@ -6,7 +6,7 @@
     str::Utf8Error,
 };
 
-use serde::ser;
+use serde::{de, ser};
 
 #[derive(Debug)]
 pub enum Error {
@@ -23,6 +23,12 @@ fn custom<T: Display>(msg: T) -> Self {
     }
 }
 
+impl de::Error for Error {
+    fn custom<T: Display>(msg: T) -> Self {
+        Error::Custom(msg.to_string())
+    }
+}
+
 impl From<NulError> for Error {
     fn from(_: NulError) -> Self {
         Error::NulEncountered
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index 80c496b8a63..e896aba5f3a 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -7,6 +7,7 @@
 #![deny(clippy::unwrap_used)]
 
 mod deserialize;
+mod deserializer;
 mod error;
 mod serialize;
 mod serializer;
@@ -20,6 +21,7 @@
 };
 
 use common::assert_field_type;
+pub use deserializer::from_qobject;
 pub use error::{Error, Result};
 pub use serializer::to_qobject;
 
-- 
2.51.0


