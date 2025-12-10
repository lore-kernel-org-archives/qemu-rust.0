Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912F2D3C933
	for <qemu-rust@archiver.kernel.org>; Wed, 10 Dec 2025 17:28:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vTNzB-0007QV-6l; Wed, 10 Dec 2025 12:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTNz8-0007Q3-39
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 12:28:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTNz5-0000z4-FN
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 12:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765387694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=seOC9xRpd8BpHlM1BeEq/huCWh/CEHy2JsXLZ/0hH9w=;
 b=Gjwm1uF7VPJv3OK7R0oFSaLvm6poH/PXFu5y76KLGSf49fflaCGEyRSzdsoJiNCBFJBw/3
 PcRQLIPBraRcGPBwiBZEYnPOCZJxFoV24bV30gBlVWWA+FqRWTI7V2GjQF+4Rs+eS+dACn
 Fb9IfiCIWTW5vahZyErTR+/bLKTUT6o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-H4Ul9WF2PcaR8mkG3auxdQ-1; Wed, 10 Dec 2025 12:28:12 -0500
X-MC-Unique: H4Ul9WF2PcaR8mkG3auxdQ-1
X-Mimecast-MFC-AGG-ID: H4Ul9WF2PcaR8mkG3auxdQ_1765387691
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42f9ece3849so1429304f8f.1
 for <qemu-rust@nongnu.org>; Wed, 10 Dec 2025 09:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765387691; x=1765992491;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=seOC9xRpd8BpHlM1BeEq/huCWh/CEHy2JsXLZ/0hH9w=;
 b=t+kT5FGTZd5yzSYB3VdHyHxcCloN916mbcEFOBgobheV4fQ/3UNNtc3TWn865u00HU
 SVyHO5Kvv7aWjVpCtCkHwMxpIcFQtgTnruGCuD7/ObmAukJtEWlyKCkdxMJtCSd4/lkc
 Hr6SRKcfpMVkgk272D3+gX5CdJg7HvoycLfgSGp47QUVMq/5pEAL3NolVLfj/U4KanwY
 3nEj3xJNnLicUPpAkmCD1z/CoApseoBpThru3GKpkd5la/TmMgPWfzD36SJ/Wlb3uy6Q
 Nm1+1HlD/JOed/ryGGXSSQKlrtTDIolgfkDdMLnPNXtgpzM14QBF0OFErwGnqB2pMBFw
 1RvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiTOEo8K7VbTVFgad/12FNqr2ErFOnwCsHDlEhyyStM0eZmfu81TB4x4rw3+bp5EwNxsn04tZ9Xi8=@nongnu.org
X-Gm-Message-State: AOJu0YytMu4jCGqaRu+NKaLTYu11z9+9DinqJZkVtpsIoGXdYhxAoVz7
 TV/GXPTAK/XbMMGmgny1sGHtkW/QHaA3FxZ8h8zlIY3kOjFQzsSF8qsZ7MYk6csv5Jw4kITh+SZ
 zkj9NY0dHzXv95SWN1I+9gGrxBjw2IYSTbxMG3G9PvDsJiRcWDiMpxIc=
X-Gm-Gg: AY/fxX5AZJjvVla/MPqRS9pB7GqMX+OpUCh3wv31tqtp9hYi0uELsrsUxsP5E9pbjjR
 1uSFp/IfAq4clK4rEGVD9pkCLupVZ4O+5duxIH5yDb8aWfYXGCNNQH1i+Jd0OoK+MsB2qGKXJrq
 UHFBrlgcdXmgBU6xtiOxNZyTeMzQoWQonvahqWdtJ80WWr+o1QOSk5MRR8E6LV2NPQQpWL1dR/P
 5GuuZeCKtIYG1QEBGomLN95TELuTZhkik8jmVtyBPgfoXDrz6NVa+Ml206BXXvm3DZZD6tU0F6r
 Sta6/AUsEo/qTiuozZkOgvHvjNKSKN3GNz1hVp+yQyed3jsSVuwXDgd+IGK5l3eIqvlXEsjRmj9
 /PuUNHBztvt7/uDmVYiICW3koGiFE+/N93L7hLRRUqGT5PsK1Z/1Ym2j+hohwckbahEvqJbSXAc
 FMaTJGDW58eSJ9PAs=
X-Received: by 2002:a5d:54d1:0:b0:42b:300f:7d8d with SMTP id
 ffacd0b85a97d-42fa3afe612mr2263739f8f.34.1765387691375; 
 Wed, 10 Dec 2025 09:28:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPxZmF/tQg9EWhcRSsJu5G7NLxSNy3ZzJzMz5UvsZwSNpc1YMwxDvZ8HoZBwyBbB1+Nop+Hw==
X-Received: by 2002:a5d:54d1:0:b0:42b:300f:7d8d with SMTP id
 ffacd0b85a97d-42fa3afe612mr2263721f8f.34.1765387690910; 
 Wed, 10 Dec 2025 09:28:10 -0800 (PST)
Received: from [192.168.10.81] ([151.95.145.106])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b85fcesm149592f8f.25.2025.12.10.09.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 09:28:10 -0800 (PST)
Message-ID: <cf58760b-db53-4201-b75d-40f94ce2c543@redhat.com>
Date: Wed, 10 Dec 2025 18:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] scripts/qapi: strip trailing whitespaces
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, qemu-rust@nongnu.org
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <20251010151006.791038-17-pbonzini@redhat.com> <87jyyw59dm.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87jyyw59dm.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h3cEPPpzAxiKOFg12hvKRAG7Sdbo38smkpWzGgIbQYQ_1765387691
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

On 12/9/25 09:48, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> This help workaround a rustfmt issue.
> 
> Which one?  Pointer suffices.
> 
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Link: https://lore.kernel.org/r/20210907121943.3498701-16-marcandre.lureau@redhat.com
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   scripts/qapi/gen.py | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index 0c9b8db3b02..c9721545ea7 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -58,7 +58,11 @@ def add(self, text: str) -> None:
>>           self._body += text
>>   
>>       def get_content(self) -> str:
>> -        return self._top() + self._preamble + self._body + self._bottom()
>> +        content = self._top() + self._preamble + self._body + self._bottom()
>> +        # delete trailing white-spaces (working around
>> +        # https://github.com/rust-lang/rustfmt/issues/4248)
>> +        content = re.sub(r'\s+$', '\n', content, 0, re.M)
>> +        return content
>>   
>>       def _top(self) -> str:
>>           # pylint: disable=no-self-use
> 
> This doesn't just delete trailing whitespace, it also collapses multiple
> blank lines into one: \s matches newlines.
> 
> We lose the ability to generate multiple blank lines for all generators
> based on QAPIGen: C (.c and .h), trace events, Rust.  Hmm.
> 
> Is collapsing blank lines necessary for working around the rustfmt
> issue?
> 
> The generators other than the Rust generator do not emit trailing
> whitespace.  Would that be practical for the Rust generator, too?

The main source is stuff like %(cfg)s and %(serde_skip_if)s.  Rust's 
syntax makes it more natural to write in this style, compared to C where 
you have "#ifdef"..."#endif", but it results in empty lines.  I'll see 
if there's another way to clean up the output.

Paolo


