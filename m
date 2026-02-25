Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC6EEFD204
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 07:54:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vv9ir-0002Po-3D; Wed, 25 Feb 2026 02:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vv9ig-0002O9-Hy
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 02:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vv9ie-0008Bb-8n
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 02:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772006042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kck12/sq6ZCjRfMVugq1HOG2Mws78HAt4wd2MwchXOA=;
 b=iWqxtDEf4gZwXcmTnf3vIb55u2zbNXlzdA2WGC6BOUML4xkmqwP7jGrl/H7LLUOT82MdiD
 f7aCwH7WHNT6yz1hD2wDiFvHpCw9KS8yEOjB29yilIoO/eooWA9iZgx2YiMMKgrbjkRiO2
 CLohjfvt8RwYsYdFcq4QNB/xzPN8ydc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-2TjxH6NMOVy97iU2k-36DQ-1; Wed, 25 Feb 2026 02:54:00 -0500
X-MC-Unique: 2TjxH6NMOVy97iU2k-36DQ-1
X-Mimecast-MFC-AGG-ID: 2TjxH6NMOVy97iU2k-36DQ_1772006039
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b8fa5744b82so176976266b.3
 for <qemu-rust@nongnu.org>; Tue, 24 Feb 2026 23:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772006039; x=1772610839;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kck12/sq6ZCjRfMVugq1HOG2Mws78HAt4wd2MwchXOA=;
 b=Wx8J/Y0LaLu4nA4T+Xis7j+Bxyyv686us1z/llhvgulB5vCorw8PgLQsbL5jQXXP/f
 ymU99qpsC/TKMokwo3WTy55O+Tl2Hb1S7mmB47pdVJ+7tODA6bLHJx6M1G3M/a3xjIIj
 CoIROortjl7aV1ydGfHvu8cloCmuaiAC601w/nv8hj061fAr9zuS80bA3/ynon32Qxkd
 EHzrmF7hQzSh5o6TLyO67zlG6CnZcf++uKxXYzx6BtxD7y4/96IYmW+ee+veh49A2Qj1
 2TGucUSW4ADWtl0hr0V3DImt+rWuW1Zluav6LlTW6Fl8xIhRXbP509f0z4Jq9/7OPNJI
 HnYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwntTJIlrWbM9aXFLMGAyeNzKeyw30/ndbBXCKGu/V+30ZcV6ptsI7eijV0n9AdQpnun7C59/rBek=@nongnu.org
X-Gm-Message-State: AOJu0YwPBubI7E66GrmrEwd1yZiDFLQn4Y5RSE3zFh2kMlIKmLYj9L+8
 xyWIaXs1risqwNdqEruaIh5oYSI1nRwAtKqGywA6GPeTpDBcGdEAo6J4D1rCFWzCQcPNJ6q6qvi
 XI9xhvC3yOcMEGfifG0zf+2PbqrsPPsVkJlyJhkaUBrTurzjLleuj25Y=
X-Gm-Gg: ATEYQzzfvGpncTmhugVnlbnIcSbLXL1CGVWhnShxvGyxKzFutfKYHB1ttA2o90V2fbb
 2rMkB6mHQ4LXnIwJv3V1pPSQ4Q6pjamyavaT1P3+jq7wsJ0Wu9wdTyB1AMHx+ScQXfpCn+a/3sx
 SC5k6LL6y05vBNCurrSSY11Bq2qd5V29nAQTYvdlOdZXkV1GvCBMSdwjH+lQXkU8rR0dKpgjyjA
 IN4bRU+x3TRyS4H2Q59l2nhJl56wW0W46bZUG3NSwtm+Jh84vWlW/7KINH1LGrE5B3FNN8iqwp1
 er45y2uso5PyU4WvLsK+kBdwf20lz+yPeQduPugcZX/IYza7VuK62HFn4fL8jlKI4aej4VXjkEv
 1OQWYjJzTcRk0QRwnANbHJ6kN38b2bj4IiA+WJH5gUxK9xNBI8RHoSodNUm1M0LHcmp9ZmRyZca
 Gu3CRuFPRsicMrBCuAJr6nJ/ns25U=
X-Received: by 2002:a17:907:7fa6:b0:b88:5158:d106 with SMTP id
 a640c23a62f3a-b9341e8272emr92850166b.52.1772006039388; 
 Tue, 24 Feb 2026 23:53:59 -0800 (PST)
X-Received: by 2002:a17:907:7fa6:b0:b88:5158:d106 with SMTP id
 a640c23a62f3a-b9341e8272emr92848266b.52.1772006038890; 
 Tue, 24 Feb 2026 23:53:58 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9348d6c5c3sm12107166b.11.2026.02.24.23.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 23:53:58 -0800 (PST)
Message-ID: <3d328c28-5640-4489-aab3-51838a62065f@redhat.com>
Date: Wed, 25 Feb 2026 08:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] scripts/qapi: add QAPISchemaIfCond.rsgen()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-10-pbonzini@redhat.com> <87pl5txqr3.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87pl5txqr3.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HWu1QBFcza3czzA-1JsMMqEsQxHXnNq5lejaC7iPpYg_1772006039
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 2/25/26 07:48, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Generate Rust #[cfg(...)] guards from QAPI 'if' conditions; it
>> turns out that they are very similar, with both of them using
>> not/any/all, so just walk the tree.
>>
>> The next commit will put it to use.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Link: https://lore.kernel.org/r/20210907121943.3498701-15-marcandre.lureau@redhat.com
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   scripts/qapi/common.py | 19 +++++++++++++++++++
>>   scripts/qapi/schema.py |  4 ++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index d7c8aa3365c..14d5dd259c4 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -199,6 +199,25 @@ def guardend(name: str) -> str:
>>                    name=c_fname(name).upper())
>>   
>>   
>> +def rsgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
>> +
>> +    def cfg(ifcond: Union[str, Dict[str, Any]]) -> str:
>> +        if isinstance(ifcond, str):
>> +            return ifcond
>> +        assert isinstance(ifcond, dict) and len(ifcond) == 1
>> +        if 'not' in ifcond:
>> +            oper = 'not'
>> +            arg = cfg(ifcond['not'])
>> +        else:
>> +            oper, operands = next(iter(ifcond.items()))
>> +            arg = ', '.join([cfg(c) for c in operands])
>> +        return f'{oper}({arg})'
>> +
>> +    if not ifcond:
>> +        return ''
>> +    return '#[cfg(%s)]' % cfg(ifcond)
>> +
>> +
> 
> Why not reuse the existing tree walker?  See appended diff.

I think it won't work due to need_parens?  gen_ifcond is really designed 
for infix notation, I have no doubt that it *can* be made to work (for 
example pass 'all' and 'any' and prefix them after processing 
need_parens), but there is little duplication in the code other than

         if isinstance(ifcond, str):
             return cond_fmt % ifcond
         assert isinstance(ifcond, dict) and len(ifcond) == 1

because unary and n-ary operators in prefix notation are quite similar, 
unlike unary and binary operators in infix notation.

Paolo


