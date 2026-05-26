Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FB3CD5BC8
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:59:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw18-0001xd-Ef; Tue, 26 May 2026 13:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw17-0001wl-0Y
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw14-0007te-AI
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttSAr3eGwRDYpXQonasNH+X2fnYc35NRwAt0tFm2UtI=;
 b=Xe6P/iUHkMGNIVryIRWP9VBwHQl52tYnD1wQkgtYWTo1QMoTeaS/hheFgys6coIH6CIFNV
 fVklTiZrAh1OtU56a/6z+FKoOYx6bEkUtuodzL4rjmWSsJKLHPizJDXET8XXvYHAP5u3ff
 PP7hE7lGeCMozUxuQvZxnk0vJAuFao4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-JMAuswBUNheaY4E0XKqbLA-1; Tue, 26 May 2026 13:56:32 -0400
X-MC-Unique: JMAuswBUNheaY4E0XKqbLA-1
X-Mimecast-MFC-AGG-ID: JMAuswBUNheaY4E0XKqbLA_1779818191
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fe24773c8so57324775e9.3
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818191; x=1780422991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ttSAr3eGwRDYpXQonasNH+X2fnYc35NRwAt0tFm2UtI=;
 b=bsT/LREnxxXaxa/PJrk+XVrP0fi72XbJgmajUl2o67F7ObpbUrnbTwoPLRc9uGFjiX
 sB3JoAwzz3U9ThEVqLz9bFBA2sGkqtZD7IC0xAfEXQ0wyBGDqUysL4vmDQKht330r1fv
 fl8OGnIdioVrW35ltkMb+40a1IhT1QXAWgBs6ZdIzPtToq2q+FTDNNNJ8WtlicQMEDHd
 TfL+rpqM6PWatvJRwr+JFlEe4jomhlc06mhGqmrFzyqg8skoZlvmO9LbrJClbIMEu5KB
 0OSPfTHOCyo9VlxVnFy+tzYI4fY43R9XmG0wz/hOpoAlf/0cSi3/wARASs5aTZN44tUX
 dQOg==
X-Gm-Message-State: AOJu0YxggrArwR6vIb5V85g2nklRQODIkNfJDwuxLkEplCJdBpnkHXCx
 hZDNX4fspE3VnEXVrMmTrwvgyCUShJZCdWlrOZOx7URlKOBRChV7xdr2iHVSDnlO996CRdQhM8a
 hybpq16G9J3kv8uCM8c/IYs4D772Iol5ZMbQNFmh/cizqx2EhpYQ0ti4=
X-Gm-Gg: Acq92OHljAXe/WmTkKn38UQPd9z6RA3tLOSSDW4MXUbz+BTGnP9cwcsHlh82II1A3SQ
 L7LSPlv5719MngtncRYIcmu2R13COLeZtszem409RNBH1JowpAKt/sSrlY1C2Y//bmvDmd0sLZZ
 +TlRz5mu75HMXUJxc+UxTuxpRsx5YKCK45yJWrNVi1AAHom2N0khmLiJu4st202tj5ZbOOhaOxF
 uQmUkChD3KHWSn7dKJMqWCp0XETOlA1IfO1sxOMwm00TikE2+Psh3pDvN+fW+9+DwVC/oj6AuEA
 CMBgpN0rpkW9HbxMMOuHv5wc7buWHhGcqYsPLKmEJ2SUl1aUFilu2ByAl4spN6kKUDtUNxkCcqi
 fc8SN7R8rAhCXOvjx2jUVLHmhfgUsa7QQ2MMKZx+YL9pYKa5YxFJ/N1QDNkDxfKMasP+G8FNJIM
 G31Z4pP/sCMqtfE8lXMYi76VeG0EW+qncasShC+w==
X-Received: by 2002:a05:600c:4688:b0:48f:e230:80a3 with SMTP id
 5b1f17b1804b1-49042ae99afmr325588795e9.33.1779818190831; 
 Tue, 26 May 2026 10:56:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4688:b0:48f:e230:80a3 with SMTP id
 5b1f17b1804b1-49042ae99afmr325588405e9.33.1779818190280; 
 Tue, 26 May 2026 10:56:30 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4907eaca94esm1474245e9.8.2026.05.26.10.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, armbru@redhat.com, marcandre.lureau@redhat.com,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 04/19] rust/qobject: add Serializer (to_qobject)
 implementation
Date: Tue, 26 May 2026 19:56:03 +0200
Message-ID: <20260526175618.227743-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qbMA_dyvTzTQS6b4Qb8lU26twMUzj6YqS691AetNUsE_1779818191
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This allows creating QObject from any serializable data structure.

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/qobject/error.rs      |  52 +++
 rust/util/src/qobject/mod.rs        |   4 +
 rust/util/src/qobject/serializer.rs | 585 ++++++++++++++++++++++++++++
 3 files changed, 641 insertions(+)
 create mode 100644 rust/util/src/qobject/error.rs
 create mode 100644 rust/util/src/qobject/serializer.rs

diff --git a/rust/util/src/qobject/error.rs b/rust/util/src/qobject/error.rs
new file mode 100644
index 00000000000..5212e65c4f7
--- /dev/null
+++ b/rust/util/src/qobject/error.rs
@@ -0,0 +1,52 @@
+//! Error data type for `QObject`'s `serde` integration
+
+use std::{
+    ffi::NulError,
+    fmt::{self, Display},
+    str::Utf8Error,
+};
+
+use serde::ser;
+
+#[derive(Debug)]
+pub enum Error {
+    Custom(String),
+    KeyMustBeAString,
+    InvalidUtf8,
+    NulEncountered,
+    NumberOutOfRange,
+}
+
+impl ser::Error for Error {
+    fn custom<T: Display>(msg: T) -> Self {
+        Error::Custom(msg.to_string())
+    }
+}
+
+impl From<NulError> for Error {
+    fn from(_: NulError) -> Self {
+        Error::NulEncountered
+    }
+}
+
+impl From<Utf8Error> for Error {
+    fn from(_: Utf8Error) -> Self {
+        Error::InvalidUtf8
+    }
+}
+
+impl Display for Error {
+    fn fmt(&self, formatter: &mut fmt::Formatter) -> fmt::Result {
+        match self {
+            Error::Custom(msg) => formatter.write_str(msg),
+            Error::KeyMustBeAString => formatter.write_str("key must be a string"),
+            Error::InvalidUtf8 => formatter.write_str("invalid UTF-8 in string"),
+            Error::NulEncountered => formatter.write_str("NUL character in string"),
+            Error::NumberOutOfRange => formatter.write_str("number out of range"),
+        }
+    }
+}
+
+impl std::error::Error for Error {}
+
+pub type Result<T> = std::result::Result<T, Error>;
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index c42b75f3199..c94b2028c1d 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -6,7 +6,9 @@
 
 #![deny(clippy::unwrap_used)]
 
+mod error;
 mod serialize;
+mod serializer;
 
 use std::{
     cell::UnsafeCell,
@@ -17,6 +19,8 @@
 };
 
 use common::assert_field_type;
+pub use error::{Error, Result};
+pub use serializer::to_qobject;
 
 use crate::bindings;
 
diff --git a/rust/util/src/qobject/serializer.rs b/rust/util/src/qobject/serializer.rs
new file mode 100644
index 00000000000..08730855731
--- /dev/null
+++ b/rust/util/src/qobject/serializer.rs
@@ -0,0 +1,585 @@
+//! `QObject` serializer
+//!
+//! This module implements a [`Serializer`](serde::ser::Serializer) that
+//! produces `QObject`s, allowing them to be created from serializable data
+//! structures (such as primitive data types, or structs that implement
+//! `Serialize`).
+
+use std::ffi::CString;
+
+use serde::ser::{Impossible, Serialize};
+
+use super::{
+    error::{Error, Result},
+    QObject,
+};
+
+pub struct SerializeTupleVariant {
+    name: CString,
+    vec: Vec<QObject>,
+}
+
+impl serde::ser::SerializeTupleVariant for SerializeTupleVariant {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        self.vec.push(to_qobject(value)?);
+        Ok(())
+    }
+
+    fn end(self) -> Result<QObject> {
+        let SerializeTupleVariant { name, vec, .. } = self;
+
+        // TODO: insert elements one at a time
+        let list = QObject::from_iter(vec);
+
+        // serde by default represents enums as a single-entry object, with
+        // the variant stored in the key ("external tagging").  Internal tagging
+        // is implemented by the struct that requests it, not by the serializer.
+        let map = [(name, list)];
+        Ok(QObject::from_iter(map))
+    }
+}
+
+pub struct SerializeStructVariant {
+    name: CString,
+    vec: Vec<(CString, QObject)>,
+}
+
+impl serde::ser::SerializeStructVariant for SerializeStructVariant {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, key: &'static str, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        self.vec.push((CString::new(key)?, to_qobject(value)?));
+        Ok(())
+    }
+
+    fn end(self) -> Result<QObject> {
+        // TODO: insert keys one at a time
+        let SerializeStructVariant { name, vec, .. } = self;
+        let list = QObject::from_iter(vec);
+
+        // serde by default represents enums as a single-entry object, with
+        // the variant stored in the key ("external tagging").  Internal tagging
+        // is implemented by the struct that requests it, not by the serializer.
+        let map = [(name, list)];
+        Ok(QObject::from_iter(map))
+    }
+}
+
+pub struct SerializeVec {
+    vec: Vec<QObject>,
+}
+
+impl serde::ser::SerializeSeq for SerializeVec {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_element<T>(&mut self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        self.vec.push(to_qobject(value)?);
+        Ok(())
+    }
+
+    fn end(self) -> Result<QObject> {
+        // TODO: insert elements one at a time
+        let SerializeVec { vec, .. } = self;
+        let list = QObject::from_iter(vec);
+        Ok(list)
+    }
+}
+
+impl serde::ser::SerializeTuple for SerializeVec {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_element<T>(&mut self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        serde::ser::SerializeSeq::serialize_element(self, value)
+    }
+
+    fn end(self) -> Result<QObject> {
+        serde::ser::SerializeSeq::end(self)
+    }
+}
+
+impl serde::ser::SerializeTupleStruct for SerializeVec {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        serde::ser::SerializeSeq::serialize_element(self, value)
+    }
+
+    fn end(self) -> Result<QObject> {
+        serde::ser::SerializeSeq::end(self)
+    }
+}
+
+struct MapKeySerializer;
+
+impl serde::Serializer for MapKeySerializer {
+    type Ok = CString;
+    type Error = Error;
+
+    type SerializeSeq = Impossible<CString, Error>;
+    type SerializeTuple = Impossible<CString, Error>;
+    type SerializeTupleStruct = Impossible<CString, Error>;
+    type SerializeTupleVariant = Impossible<CString, Error>;
+    type SerializeMap = Impossible<CString, Error>;
+    type SerializeStruct = Impossible<CString, Error>;
+    type SerializeStructVariant = Impossible<CString, Error>;
+
+    #[inline]
+    fn serialize_unit_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+    ) -> Result<CString> {
+        Ok(CString::new(variant)?)
+    }
+
+    #[inline]
+    fn serialize_newtype_struct<T>(self, _name: &'static str, value: &T) -> Result<CString>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    fn serialize_bool(self, _value: bool) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_i8(self, _value: i8) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_i16(self, _value: i16) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_i32(self, _value: i32) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_i64(self, _value: i64) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_i128(self, _value: i128) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_u8(self, _value: u8) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_u16(self, _value: u16) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_u32(self, _value: u32) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_u64(self, _value: u64) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_u128(self, _value: u128) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_f32(self, _value: f32) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_f64(self, _value: f64) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    #[inline]
+    fn serialize_char(self, _value: char) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    #[inline]
+    fn serialize_str(self, value: &str) -> Result<CString> {
+        Ok(CString::new(value)?)
+    }
+
+    fn serialize_bytes(self, value: &[u8]) -> Result<CString> {
+        Ok(CString::new(value)?)
+    }
+
+    fn serialize_unit(self) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_unit_struct(self, _name: &'static str) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_newtype_variant<T>(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _value: &T,
+    ) -> Result<CString>
+    where
+        T: ?Sized + Serialize,
+    {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_none(self) -> Result<CString> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_some<T>(self, _value: &T) -> Result<CString>
+    where
+        T: ?Sized + Serialize,
+    {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_seq(self, _len: Option<usize>) -> Result<Self::SerializeSeq> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_tuple(self, _len: usize) -> Result<Self::SerializeTuple> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_tuple_struct(
+        self,
+        _name: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeTupleStruct> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_tuple_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeTupleVariant> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_map(self, _len: Option<usize>) -> Result<Self::SerializeMap> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_struct(self, _name: &'static str, _len: usize) -> Result<Self::SerializeStruct> {
+        Err(Error::KeyMustBeAString)
+    }
+
+    fn serialize_struct_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        _variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeStructVariant> {
+        Err(Error::KeyMustBeAString)
+    }
+}
+
+pub struct SerializeMap {
+    vec: Vec<(CString, QObject)>,
+    next_key: Option<CString>,
+}
+
+impl serde::ser::SerializeMap for SerializeMap {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_key<T>(&mut self, key: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        self.next_key = Some(key.serialize(MapKeySerializer)?);
+        Ok(())
+    }
+
+    fn serialize_value<T>(&mut self, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        let key = self.next_key.take();
+        // Panic because this indicates a bug in the program rather than an
+        // expected failure.
+        let key = key.expect("serialize_value called before serialize_key");
+        self.vec.push((key, to_qobject(value)?));
+        Ok(())
+    }
+
+    fn end(self) -> Result<QObject> {
+        // TODO: insert keys one at a time
+        let SerializeMap { vec, .. } = self;
+        Ok(QObject::from_iter(vec))
+    }
+}
+
+impl serde::ser::SerializeStruct for SerializeMap {
+    type Ok = QObject;
+    type Error = Error;
+
+    fn serialize_field<T>(&mut self, key: &'static str, value: &T) -> Result<()>
+    where
+        T: ?Sized + Serialize,
+    {
+        serde::ser::SerializeMap::serialize_entry(self, key, value)
+    }
+
+    fn end(self) -> Result<QObject> {
+        serde::ser::SerializeMap::end(self)
+    }
+}
+
+/// Serializer whose output is a `QObject`.
+///
+/// This is the serializer that backs [`to_qobject`].
+pub struct Serializer;
+
+impl serde::Serializer for Serializer {
+    type Ok = QObject;
+    type Error = Error;
+    type SerializeSeq = SerializeVec;
+    type SerializeTuple = SerializeVec;
+    type SerializeTupleStruct = SerializeVec;
+    type SerializeTupleVariant = SerializeTupleVariant;
+    type SerializeMap = SerializeMap;
+    type SerializeStruct = SerializeMap;
+    type SerializeStructVariant = SerializeStructVariant;
+
+    #[inline]
+    fn serialize_bool(self, value: bool) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    #[inline]
+    fn serialize_i8(self, value: i8) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    #[inline]
+    fn serialize_i16(self, value: i16) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    #[inline]
+    fn serialize_i32(self, value: i32) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    fn serialize_i64(self, value: i64) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    fn serialize_i128(self, value: i128) -> Result<QObject> {
+        if let Ok(value) = u64::try_from(value) {
+            Ok(value.into())
+        } else if let Ok(value) = i64::try_from(value) {
+            Ok(value.into())
+        } else {
+            Err(Error::NumberOutOfRange)
+        }
+    }
+
+    #[inline]
+    fn serialize_u8(self, value: u8) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    #[inline]
+    fn serialize_u16(self, value: u16) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    #[inline]
+    fn serialize_u32(self, value: u32) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    #[inline]
+    fn serialize_u64(self, value: u64) -> Result<QObject> {
+        Ok(value.into())
+    }
+
+    fn serialize_u128(self, value: u128) -> Result<QObject> {
+        if let Ok(value) = u64::try_from(value) {
+            Ok(value.into())
+        } else {
+            Err(Error::NumberOutOfRange)
+        }
+    }
+
+    #[inline]
+    fn serialize_f32(self, float: f32) -> Result<QObject> {
+        Ok(float.into())
+    }
+
+    #[inline]
+    fn serialize_f64(self, float: f64) -> Result<QObject> {
+        Ok(float.into())
+    }
+
+    #[inline]
+    fn serialize_char(self, value: char) -> Result<QObject> {
+        let mut s = String::new();
+        s.push(value);
+        Ok(CString::new(s)?.into())
+    }
+
+    #[inline]
+    fn serialize_str(self, value: &str) -> Result<QObject> {
+        Ok(CString::new(value)?.into())
+    }
+
+    fn serialize_bytes(self, value: &[u8]) -> Result<QObject> {
+        // Serialize into a vector of numeric QObjects
+        let it = value.iter().copied();
+        Ok(QObject::from_iter(it))
+    }
+
+    #[inline]
+    fn serialize_unit(self) -> Result<QObject> {
+        Ok(().into())
+    }
+
+    #[inline]
+    fn serialize_unit_struct(self, _name: &'static str) -> Result<QObject> {
+        self.serialize_unit()
+    }
+
+    #[inline]
+    fn serialize_unit_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+    ) -> Result<QObject> {
+        self.serialize_str(variant)
+    }
+
+    #[inline]
+    fn serialize_newtype_struct<T>(self, _name: &'static str, value: &T) -> Result<QObject>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    fn serialize_newtype_variant<T>(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+        value: &T,
+    ) -> Result<QObject>
+    where
+        T: ?Sized + Serialize,
+    {
+        // serde by default represents enums as a single-entry object, with
+        // the variant stored in the key ("external tagging").  Internal tagging
+        // is implemented by the struct that requests it, not by the serializer.
+        let map = [(CString::new(variant)?, to_qobject(value)?)];
+        Ok(QObject::from_iter(map))
+    }
+
+    #[inline]
+    fn serialize_none(self) -> Result<QObject> {
+        self.serialize_unit()
+    }
+
+    #[inline]
+    fn serialize_some<T>(self, value: &T) -> Result<QObject>
+    where
+        T: ?Sized + Serialize,
+    {
+        value.serialize(self)
+    }
+
+    fn serialize_seq(self, len: Option<usize>) -> Result<Self::SerializeSeq> {
+        Ok(SerializeVec {
+            vec: Vec::with_capacity(len.unwrap_or(0)),
+        })
+    }
+
+    fn serialize_tuple(self, len: usize) -> Result<Self::SerializeTuple> {
+        self.serialize_seq(Some(len))
+    }
+
+    fn serialize_tuple_struct(
+        self,
+        _name: &'static str,
+        len: usize,
+    ) -> Result<Self::SerializeTupleStruct> {
+        self.serialize_seq(Some(len))
+    }
+
+    fn serialize_tuple_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+        len: usize,
+    ) -> Result<Self::SerializeTupleVariant> {
+        Ok(SerializeTupleVariant {
+            name: CString::new(variant)?,
+            vec: Vec::with_capacity(len),
+        })
+    }
+
+    fn serialize_map(self, _len: Option<usize>) -> Result<Self::SerializeMap> {
+        Ok(SerializeMap {
+            vec: Vec::new(),
+            next_key: None,
+        })
+    }
+    fn serialize_struct(self, _name: &'static str, len: usize) -> Result<Self::SerializeStruct> {
+        self.serialize_map(Some(len))
+    }
+
+    fn serialize_struct_variant(
+        self,
+        _name: &'static str,
+        _variant_index: u32,
+        variant: &'static str,
+        _len: usize,
+    ) -> Result<Self::SerializeStructVariant> {
+        Ok(SerializeStructVariant {
+            name: CString::new(variant)?,
+            vec: Vec::new(),
+        })
+    }
+}
+
+pub fn to_qobject<T>(input: T) -> Result<QObject>
+where
+    T: Serialize,
+{
+    input.serialize(Serializer)
+}
-- 
2.54.0


