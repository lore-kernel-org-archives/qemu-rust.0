Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E810AE9B24E
	for <qemu-rust@archiver.kernel.org>; Tue, 24 Feb 2026 10:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vupxo-0005MK-IC; Tue, 24 Feb 2026 05:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vupxi-0005KB-MN
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 05:48:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vupxf-00044r-GS
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 05:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771930093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fI0+FKAuy64qy7I8iClE651uCbkhETRDAcOhEnpyQ6o=;
 b=ZU8xrCmfJG3hhXbgELfgbgARESF4LStCHwZ5DmKDr5xbYFkVLBYcNlsifb4TlIPtXheZp0
 +boqOXAwhiN19qjZQi02XsDf+9ZCjpJeOUUrAKQGs8vbvtMeT2MIFyLQ0M7953pGy4U/5h
 9nsLPjW0S2sfqCFWGSYYfrLpaYO1YNk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-1nNAN0bmM_uxtinEUcWhqg-1; Tue, 24 Feb 2026 05:48:11 -0500
X-MC-Unique: 1nNAN0bmM_uxtinEUcWhqg-1
X-Mimecast-MFC-AGG-ID: 1nNAN0bmM_uxtinEUcWhqg_1771930091
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4836b7c302fso45545625e9.1
 for <qemu-rust@nongnu.org>; Tue, 24 Feb 2026 02:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771930090; x=1772534890;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fI0+FKAuy64qy7I8iClE651uCbkhETRDAcOhEnpyQ6o=;
 b=xLj74HpYyOG9T881ch9qBOUMIC4qCm5w2auvSQ/khHAcda7T387XIMa48hw4ViFAcG
 2/oB6qPvD+CZi3YiJJyuMm/k2d7NWU2rw8vTrTolfxruJIuMTxhjppcwuTPgeE2EKB/E
 YPJGXlTkNNBn36uhV0qDJOvNzfE5Zz5GCLocG40Nk658kQLHWZw/nhO0E1qhgL6WAa/I
 d55nSEXLvf2jJn2TRwhcsyjz6TplSSJWy5bsWcDldiEqcblwRaJQS/6q+yh4NFnITb6J
 j2EvUCj3Br0Tq91hZo3SHGvb7NlLqPsmU8SweyTOZ6S2k5T+7P5sykBjZRd+8jtKuaXZ
 RrLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3U1tdrTwQw5YZTMnhd0BP7/dULo/olNVzV6JPUMuW5Qvd3fgol9jt00RHZtR1b9GiAfMUPR3IGHA=@nongnu.org
X-Gm-Message-State: AOJu0YyD8uhi/85NdVXfC7Abp39cvKaEfxFayLCaaNxbbKXyL3dGAABg
 +cshz/HU2yV9l2LDPrpj8CjwzCcR+SjttwrQCCorvXejG3YQVrUEukfzY88UpDqK0PyMT/b01Jk
 LYVRcoq0swFvR709Iiegevse0h53Z5F/nbP0ShuNkZ0gGKk83j9SUgLI=
X-Gm-Gg: AZuq6aID2TZQXohB4mwDFWk0rgLIQFKAPn4+IW3AQHYNsSl179wgljb6OcGjTsv84Pm
 iXMazEyjcmQV1lIKIctT/RzZBbmr4JA9l9Rl/8mkz9ZH698vE6fnr7BSsZHg6NEv+yIESJvZF98
 burUTUv6VNJCxG+qrEHpSSPI6GbkxV+eLf1EZZj7Chp7y0HSbXKTr2waEfiNpMGaSWH7rxAXW10
 aK/WxaAQFSpDh8GFNvrJ0vEH/hWYb3fLhCRvlA4WvGL8HzJj+oyhMmgaTh2CArjZ+d9x0SKP9eW
 PGmPI1GjCpO9iGN91tFpc9UpqRiGtKt1LFmVO48ii3STKykY4/iGjL9F5OK+Yn1tkpaAO/Io0Py
 +SdQY0JbPYjWz0gQQhcvdX90Pd/6DjfxpeVuoa+wzHEUGjziOuVcM8Fh1dYhOQeq+5ARmS6juEv
 HiIjVn30NV5JbkHNdTAv/kh0uxnjw=
X-Received: by 2002:a05:600c:6298:b0:480:3bba:1cac with SMTP id
 5b1f17b1804b1-483a95eb81fmr179791065e9.6.1771930090574; 
 Tue, 24 Feb 2026 02:48:10 -0800 (PST)
X-Received: by 2002:a05:600c:6298:b0:480:3bba:1cac with SMTP id
 5b1f17b1804b1-483a95eb81fmr179790725e9.6.1771930090070; 
 Tue, 24 Feb 2026 02:48:10 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-483a9b75b4dsm426146145e9.4.2026.02.24.02.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:48:09 -0800 (PST)
Message-ID: <a7521b49-432a-4e60-8446-93338c61caff@redhat.com>
Date: Tue, 24 Feb 2026 11:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] rust/qobject: add Serialize implementation
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-4-pbonzini@redhat.com> <87ecma4ep2.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ecma4ep2.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O40kbPuohFzO52d1RKNzgLsg3RMg0qB5m3hUFsT47b0_1771930091
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
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

On 2/24/26 11:29, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> This allows QObject to be converted to other formats, for example
>> JSON via serde_json.
>>
>> This is not too useful, since QObjects are consumed by
>> C code or deserialized into structs, but it can be used for testing
>> and it is part of the full implementation of a serde format.
>>
>> Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> [...]
> 
>> diff --git a/rust/util/src/qobject/serialize.rs b/rust/util/src/qobject/serialize.rs
>> new file mode 100644
>> index 00000000000..34ec3847c1d
>> --- /dev/null
>> +++ b/rust/util/src/qobject/serialize.rs
>> @@ -0,0 +1,59 @@
>> +//! `QObject` serialization
>> +//!
>> +//! This module implements the [`Serialize`] trait for `QObject`,
>> +//! allowing it to be converted to other formats, for example
>> +//! JSON.
>> +
>> +use std::{ffi::CStr, mem::ManuallyDrop, ptr::addr_of};
>> +
>> +use serde::ser::{self, Serialize, SerializeMap, SerializeSeq};
>> +
>> +use super::{match_qobject, QObject};
>> +use crate::bindings;
>> +
>> +impl Serialize for QObject {
>> +    #[inline]
>> +    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
>> +    where
>> +        S: ::serde::Serializer,
>> +    {
>> +        match_qobject! { (self) =>
>> +            () => serializer.serialize_unit(),
>> +            bool(b) => serializer.serialize_bool(b),
>> +            i64(i) => serializer.serialize_i64(i),
>> +            u64(u) => serializer.serialize_u64(u),
>> +            f64(f) => serializer.serialize_f64(f),
>> +            CStr(cstr) => cstr.to_str().map_or_else(
>> +                |_| Err(ser::Error::custom("invalid UTF-8 in QString")),
> 
> .to_str() fails when its argument is invalid UTF-8.  It returns "an
> error with details of where UTF-8 validation failed."[1]
> 
> Why are we replacing this error with a custom one?  I guess we add the
> clue "in QString".  We also lose the details of where.  Feels like a
> questionable trade.

Changing the error is required in order to return an S::Error (that is, 
the serializer asks for a type of error that it understands).  I can 
also preserve the message with "|e| Err(ser::Error::custom(e))" or 
something like that.

While it is undoubtedly a programming error, I didn't like that the 
error (and thus the panic) happens in a different place than where the 
QString is constructed.  I like panicking for *my* programming errors, 
but not for someone else's :) especially if I can recover easily.

Paolo


