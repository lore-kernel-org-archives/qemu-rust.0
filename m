Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B98D2F7DD
	for <qemu-rust@archiver.kernel.org>; Fri,  5 Dec 2025 11:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vRU0x-0003RU-D1; Fri, 05 Dec 2025 06:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vRU0v-0003Qt-PA
 for qemu-rust@nongnu.org; Fri, 05 Dec 2025 06:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vRU0t-0005pd-VQ
 for qemu-rust@nongnu.org; Fri, 05 Dec 2025 06:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764934214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=x60H//1z3cO5nwTrgatopeBQx6fItdRMdgG+KGBioNA=;
 b=f9wl05TSCf315Duu05CxRfXp9ONz2MhYrB6gtT7gs8VIQyceP9M93sYWnQ1dQK5PlgCj8B
 zRjCqZwXn3iwDfHwxf6/NxfnfMXhBrWU3QncqrNGyVHQkmkWV7hqP2N2X7G/2b3+fHP4u6
 Sa2+tsteT4wscq4aM7gAC8vYtr/9yU4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-bdTL8hUeMk2DS4lQ5KraqQ-1; Fri, 05 Dec 2025 06:30:13 -0500
X-MC-Unique: bdTL8hUeMk2DS4lQ5KraqQ-1
X-Mimecast-MFC-AGG-ID: bdTL8hUeMk2DS4lQ5KraqQ_1764934212
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42e1e1ca008so1708642f8f.0
 for <qemu-rust@nongnu.org>; Fri, 05 Dec 2025 03:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764934212; x=1765539012;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x60H//1z3cO5nwTrgatopeBQx6fItdRMdgG+KGBioNA=;
 b=sf0qVL0DPn+U5RpH+TjQ84oSrs1FpbLGAjRLlDv9o4rbHKPoqKZHzYobN4Bk9V2O13
 59rxfe4XzhcQEB/qZFfT6tSBhrZCpZXOBsCcV8dD3P2YlOndDOsUl0XXAZWOLHC8bLf/
 J9ET42nBpvN/js2U/i9pXL13oYOr1Yd+x7SzuVFc1n+qcMAFX7NFOtQfz8GX5rba2AEW
 kkdSXMWcy9Xb0efepBh/ff9WdmmnFKcx6rRhJ1ZDiGReW2hmpdCisEdvKKJ4mKKX/lVx
 SwE9lUqdFwY7PO3W1pqUYHsdqJ6xFSOdCDdYtujyUC4qWVx9cdQAd8NEael5vEsjqWp0
 r8Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfdbDNP2Nlpbtzlq8jamR927CZ+IFcZ8F9/Q0m/r+lp8eJLZqlDYTnFpVCNdnb+DtGHpw//FnNWeU=@nongnu.org
X-Gm-Message-State: AOJu0YxizyfQEE7AwwnDp66yrLlt+dG+ojO739w3/2xZOgUo1X7fK+8q
 BZzUEpGUgQUVh4d6Qom94Aj+g2rttl5ZVuC0ybwxIOEepCGwQCFmWtBA6Pkgq3DCCqhW9ZcVj5q
 QplfjTUDmKwVWCEV0UAIXK5C/5jZchk10GpCqxfyBOt/FTXXPTUF8MWw=
X-Gm-Gg: ASbGncvyHwD0opg4sn1Wtr3Gp5F4YKDPTpqdwEyNwSFXtY1zrWbaGCAWIFFoyIn5out
 7WL+4Bz9JRaUt73jzJaGdQHPSaf0vdijMqxT8UPJkh6zxUHbq+qBQfIa09OXqwDHVWf3g5IraOc
 9MoYhYJiToblGTRRckbpaYoCYx0UXov67W7oquolvVxsWMYitLw6daoyNsYb645tsG/HoS//QkD
 X5zOL78wlvZN6a0808nQJsbpZBvOzMs5yMzYK7W+FV3LRjBUviyl+pYq/f5cAYiNbd4C/JUeMBs
 0um66jtUjXQP5VGzXn1a6ueEIE8qNmrnDsw2HWYHkL4jfRzhAn4dhLV8Umamn7Ebx8zwK45s48y
 F3NpgFa+HQTXF2MtqkRCI/HKViIbN6rjsah35OE0m3GRSaSmtssf+c1rWwIpuUFvBkGeRcSmNkk
 2Y/rFaZHeYhgcHQU8=
X-Received: by 2002:a05:600c:a07:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-4792eb10ddcmr63074845e9.3.1764934212344; 
 Fri, 05 Dec 2025 03:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVk4Sk3ZH8EZ7nLY0EfKsXpUeYumaLoiZzPfJIfkt92k7CRko8I5Tw/cPt6bXDTJ3JrWlj/Q==
X-Received: by 2002:a05:600c:a07:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-4792eb10ddcmr63074515e9.3.1764934211730; 
 Fri, 05 Dec 2025 03:30:11 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47930c7473bsm125829785e9.10.2025.12.05.03.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 03:30:11 -0800 (PST)
Message-ID: <27641d41-010d-4239-a84e-4b7724f3c30a@redhat.com>
Date: Fri, 5 Dec 2025 12:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] rust: add basic QObject bindings
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, armbru@redhat.com,
 marcandre.lureau@redhat.com
References: <20251001075005.1041833-1-pbonzini@redhat.com>
 <20251001080051.1043944-3-pbonzini@redhat.com> <aTGXmfbzug5cQAbV@intel.com>
 <382ef69e-50b7-4a7f-aa9d-63c076a737f3@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <382ef69e-50b7-4a7f-aa9d-63c076a737f3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t0qNPWDx6Z5M2HcET1CQsWOPeVikhImbYR2YkuRg19U_1764934212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 12/4/25 15:18, Paolo Bonzini wrote:
> On 12/4/25 15:15, Zhao Liu wrote:
>>> diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
>>> new file mode 100644
>>> index 00000000000..f43d87a3b66
>>> --- /dev/null
>>> +++ b/rust/util/src/qobject/mod.rs
>>> @@ -0,0 +1,309 @@
>>> +//! `QObject` bindings
>>> +//!
>>> +//! This module implements bindings for QEMU's `QObject` data 
>>> structure.
>>> +//! The bindings integrate with `serde`, which take the role of 
>>> visitors
>>> +//! in Rust code.
>>> +
>>> +#![deny(clippy::unwrap_used)]
>>
>> Are there are any specific considerations for this lint rule?
> 
> It ensures that all conversion errors (e.g. from try_into()) are 
> propagated.
> 
>>> +pub struct QObject(&'static UnsafeCell<bindings::QObject>);
>>
>> It seems Opaque<> feels more natural than UnsafeCell<>.
>>
>> Opaque::from_raw() requires *mut T, but QObject::from_raw() and
>> QObject::clone_from_raw() mainly play with C bindings which usually use
>> *mut pointer. So it seems unnecessary to convert *mut to *const in the
>> middle.
>>
>> And furthermore, I think QObject(Opaque<bindings::QObject>) is better
>> than QObject(&'static Opaque<bindings::QObject>). From a semantic view,
>> C's QObject is a struct, while Rust's QObject is a reference, which seems
>> somewhat mismatched.
>>
>> I'm not sure yet if there may be gaps when remove &'static, but it
>> looks like using &'static Opaque<> instead of &'static UnsafeCell<> is
>> Okay in code?
> 
> I am using UnsafeCell because the QObject here is always valid, i.e. 
> MaybeUninit is explicitly not necessary.  Opaque explicitly allows it to 
> be invalid, here instead the API is "create via C code or FFI and only 
> then create the QObject".
> 
> However, while it is possible to use Opaque<> instead of UnsafeCell<>, 
> it is not possible to make this a simple wrapper because QObject is 
> unmovable and reference counted.  That is, QObject is the equivalent of 
> (for example) Owned<DeviceState>.
> 
>> These 2 methods are the clone, but it seems they're actually similar to
>> Owned<>, i.e., increase refcnt when Rust side wants to "own" or ensure
>> to use this safely.
>>
>> However, there indeed isn't a non-object version of Owned for now, so I
>> think this kind of clone should be okay. Hmm, for long-term, is it
>> valuable to consider a more generic Owned<>?
> 
> Linux has ARef<> I think.  But it seems overkill for now.
> 
>>> +impl<A> FromIterator<A> for QObject
>>> +where
>>> +    Self: From<A>,
>>> +{
>>> +    fn from_iter<I: IntoIterator<Item = A>>(it: I) -> Self {
>>
>> nit: maybe the name "iter" is better than "it"?
> 
> Sure.
> 
>>> +                    match qnum__.kind {
>>> +                        $($crate::bindings::QNUM_I64 => break {
>>> +                            let $i64var = unsafe { qnum__.u.i64_ };
>>> +                            $i64
>>> +                        },)?
>>> +                        $($crate::bindings::QNUM_U64 => break {
>>> +                            let $u64var = unsafe { qnum__.u.u64_ };
>>> +                            $u64
>>> +                        },)?
>>> +                        $($crate::bindings::QNUM_DOUBLE => break {
>>> +                            let $f64var = unsafe { qnum__.u.dbl };
>>> +                            $f64
>>> +                        },)?
>>> +                        _ => {}
>>
>> I think this doesn't handle a special case: qobj's QNUM type doesn't
>> macth the value type, for example, qobj is QNUM_U64 but value is i64.
>>
>> Though external code won't use this macro, I think panic may be better
>> than {}?> Thurther, there're 2 match blocks. Could we merge them as one?

Just one thing: it's not returning {}, it's returning the value 
expressed in $(_ => $other:expr,)?.  So I think it's better to keep it 
this way.

Paolo


