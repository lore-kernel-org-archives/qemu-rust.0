Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EBBE9B258
	for <qemu-rust@archiver.kernel.org>; Tue, 24 Feb 2026 13:42:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vusfo-0005eh-Vq; Tue, 24 Feb 2026 08:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vusfn-0005eH-G3
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 08:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vusfm-000783-0U
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 08:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771940516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPW7AGomSnNXp68ndgyHZG/Y+NeveapmR4BmjTTnC4w=;
 b=CshPd5fDhDTVhr1tYJlvcXX1qJavDx82BOfEF3n1CaIWzPrEC19QJTQID8VSrQciQEabAg
 YyKppJ+zGcWWF9gsALxbI4rdusHojvB/DxkwJBWpFRT9v2TGWiAag5Uu2ExsWPJFR1uHBu
 gkPz7BsR+4rbcJBrtfkN7YaCdK1bp40=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-Z1wEdxeSPymu3lLCBk_fbw-1; Tue,
 24 Feb 2026 08:41:51 -0500
X-MC-Unique: Z1wEdxeSPymu3lLCBk_fbw-1
X-Mimecast-MFC-AGG-ID: Z1wEdxeSPymu3lLCBk_fbw_1771940510
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 28C931956079; Tue, 24 Feb 2026 13:41:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.13])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A84A619560A2; Tue, 24 Feb 2026 13:41:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F81B21E692D; Tue, 24 Feb 2026 14:41:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org,  Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 03/16] rust/qobject: add Serialize implementation
In-Reply-To: <a7521b49-432a-4e60-8446-93338c61caff@redhat.com> (Paolo
 Bonzini's message of "Tue, 24 Feb 2026 11:48:08 +0100")
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-4-pbonzini@redhat.com>
 <87ecma4ep2.fsf@pond.sub.org>
 <a7521b49-432a-4e60-8446-93338c61caff@redhat.com>
Date: Tue, 24 Feb 2026 14:41:47 +0100
Message-ID: <87qzqa1co4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: mcikuFjYQ7fGpdXajQN2U6U47sLJcJoqrfdYLyGUPvc_1771940510
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 2/24/26 11:29, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> This allows QObject to be converted to other formats, for example
>>> JSON via serde_json.
>>>
>>> This is not too useful, since QObjects are consumed by
>>> C code or deserialized into structs, but it can be used for testing
>>> and it is part of the full implementation of a serde format.
>>>
>>> Co-authored-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>=20
>> [...]
>>=20
>>> diff --git a/rust/util/src/qobject/serialize.rs b/rust/util/src/qobject=
/serialize.rs
>>> new file mode 100644
>>> index 00000000000..34ec3847c1d
>>> --- /dev/null
>>> +++ b/rust/util/src/qobject/serialize.rs
>>> @@ -0,0 +1,59 @@
>>> +//! `QObject` serialization
>>> +//!
>>> +//! This module implements the [`Serialize`] trait for `QObject`,
>>> +//! allowing it to be converted to other formats, for example
>>> +//! JSON.
>>> +
>>> +use std::{ffi::CStr, mem::ManuallyDrop, ptr::addr_of};
>>> +
>>> +use serde::ser::{self, Serialize, SerializeMap, SerializeSeq};
>>> +
>>> +use super::{match_qobject, QObject};
>>> +use crate::bindings;
>>> +
>>> +impl Serialize for QObject {
>>> +    #[inline]
>>> +    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
>>> +    where
>>> +        S: ::serde::Serializer,
>>> +    {
>>> +        match_qobject! { (self) =3D>
>>> +            () =3D> serializer.serialize_unit(),
>>> +            bool(b) =3D> serializer.serialize_bool(b),
>>> +            i64(i) =3D> serializer.serialize_i64(i),
>>> +            u64(u) =3D> serializer.serialize_u64(u),
>>> +            f64(f) =3D> serializer.serialize_f64(f),
>>> +            CStr(cstr) =3D> cstr.to_str().map_or_else(
>>> +                |_| Err(ser::Error::custom("invalid UTF-8 in QString")=
),
>>=20
>> .to_str() fails when its argument is invalid UTF-8.  It returns "an
>> error with details of where UTF-8 validation failed."[1]
>>=20
>> Why are we replacing this error with a custom one?  I guess we add the
>> clue "in QString".  We also lose the details of where.  Feels like a
>> questionable trade.
>
> Changing the error is required in order to return an S::Error (that is,=
=20
> the serializer asks for a type of error that it understands).  I can=20
> also preserve the message with "|e| Err(ser::Error::custom(e))" or=20
> something like that.

If it's not too much trouble...

> While it is undoubtedly a programming error, I didn't like that the=20
> error (and thus the panic) happens in a different place than where the=20
> QString is constructed.  I like panicking for *my* programming errors,=20
> but not for someone else's :) especially if I can recover easily.

I ruthlessly panic when I find invariants violated, preconditions like
this one very much included.

If you'd rather not panic here, please make it locally obvious that the
error is not supposed to happen.  Suggest to put it into the error
message, so increase the likelihood of the programming error actually
getting fixed if it ever triggers.


