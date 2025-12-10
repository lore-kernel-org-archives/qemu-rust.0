Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2871D3C928
	for <qemu-rust@archiver.kernel.org>; Wed, 10 Dec 2025 17:20:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vTNqu-0005uX-Kc; Wed, 10 Dec 2025 12:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTNqs-0005u5-2N
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 12:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vTNqq-0007sG-0H
 for qemu-rust@nongnu.org; Wed, 10 Dec 2025 12:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765387181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n/bi4hXd77xtlzpxZSweyBsCJ2kB442lBr797cluk9U=;
 b=AU/pnRkkQwRpwUIIn7xcYgc90j2zicrzif1Ev/tJbQXuSpChqNzfosxBoIJsiO4a9V86vV
 QaGx8QeNlFeJ+abz65gamNRgFKrWQ3ZwYpaoxyvOu02vr8wqevF9Jnfnze+Lfyih6bm4DN
 X9HxTOkYR3Tdpxp33lXECL+YiJqsgG0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-x0kmrR_aMRewzkgsw5AiLQ-1; Wed, 10 Dec 2025 12:19:40 -0500
X-MC-Unique: x0kmrR_aMRewzkgsw5AiLQ-1
X-Mimecast-MFC-AGG-ID: x0kmrR_aMRewzkgsw5AiLQ_1765387179
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42f9e62b4feso32338f8f.0
 for <qemu-rust@nongnu.org>; Wed, 10 Dec 2025 09:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765387179; x=1765991979;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/bi4hXd77xtlzpxZSweyBsCJ2kB442lBr797cluk9U=;
 b=Mw6g4ZoT9LqMfcWB7JUQdKgD1X7ojrnzK3+O8h/7bDu9dlYsDbFjiRx4itihIvy8kk
 ynDbdCrdrMqTTmo+9T5SRp7v0NpdZOydQ5mMNxESpYJp+ulYb0diouvzeVNyHlsomGjG
 QWHvb3Vi32TQdRuIWxkVsvimHhQk6fGNoXKff2wTzBzy8xZw1eZh1xHw0AkdGW0jdWQJ
 3PasO/FxzEjs6+4yKTFJTpXwttWWvru/M5bnNexCvdYU0haqvOwgspGJRazsAErM1M1c
 IGTAEm39SX/lQUXnwsHnZ0NHtFxE4JECujZLJVYahMHYgGdt2yLmqVabKmLdNCyWRrrM
 H69A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC8CsTg3ppyZgutc2iPD8XP9wgk67rBNWYMqtNDfpaRcE5bNHFBoYynxqu9DJWV4g1p+/iV4i240M=@nongnu.org
X-Gm-Message-State: AOJu0YykGSLlGi49oNn5vfs+4pzfoJRP75rWjG3wXntgbg27GHOslT/r
 mSIjFCK/U1rcM/iuSuwmmitqVOguKihXSD9IAU7aMnCwCazEO3oR/Vaw+M7ojlcyklB0RcKCn86
 f9O/J7DGU0yZsJVDNvcFOKvh1lTVett1Sh0u+hN7YojwnkzWZ3T44L5w=
X-Gm-Gg: AY/fxX67NegQFhu5XnVDeQEH/KO/YQYIcp9lSzji9jwoI/0NsqrkZ50sL6JwlJSY2+c
 /C+NiDp58ECyyGWX2/9Ufc5tFgadziTH8qlMjiP8n3NmKe9ywNKEi3vKv5EOqsF+tQpuuG9bcA0
 zfW2M5vX76RlrY2UHXfdMx6vFRxjIxVECC2efFff/d8723Qzl0vRoxP2IlSezjabNhTOhGp8b+h
 c0JCi3tT/cEwTEDP2Fb0SWLvjOTsoxl926HLjLXj/sUNhnsNIoz52RVdLSUrj9WMwJ6kReg4nnk
 fIxTW3DdPad0DAdMTiqPbhuRpOvkneUR5ODCuGD8DwxPL2gICdqEbKk1Z27H5gpd1H66V4Wz+Y2
 E92c/h7x5Yn8suWaCfYOGRkebMPl4JfIl9FY5NOJ3MFm+4L/YcQXOB64FJsCAptnmStuHKy1xE7
 YJEvkBc2lXpHbhWCE=
X-Received: by 2002:a05:6000:186b:b0:42b:3455:e4a1 with SMTP id
 ffacd0b85a97d-42fa89ec4a8mr215123f8f.15.1765387179277; 
 Wed, 10 Dec 2025 09:19:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkAKahCwN0k6df8RMeBvgFidiJdlAa8mo4FMWukQK0sxXiNj84d4mzykYjbpQ4dzBiOu0BZg==
X-Received: by 2002:a05:6000:186b:b0:42b:3455:e4a1 with SMTP id
 ffacd0b85a97d-42fa89ec4a8mr215086f8f.15.1765387178806; 
 Wed, 10 Dec 2025 09:19:38 -0800 (PST)
Received: from [192.168.10.81] ([151.95.145.106])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a70394sm146572f8f.14.2025.12.10.09.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 09:19:38 -0800 (PST)
Message-ID: <239ea6cb-de87-48b7-8ef0-71158bf5ae70@redhat.com>
Date: Wed, 10 Dec 2025 18:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] rust/qobject: add Serialize implementation
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, qemu-rust@nongnu.org
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <20251010151006.791038-7-pbonzini@redhat.com> <87a4zx5kgm.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87a4zx5kgm.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MMXZ5wTm-J2-0mtPNE5imbeEgBLYv8Q5g07tLpdaxpk_1765387179
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/5/25 10:47, Markus Armbruster wrote:
>> +        match_qobject! { (self) =>
>> +            () => serializer.serialize_unit(),
>> +            bool(b) => serializer.serialize_bool(b),
>> +            i64(i) => serializer.serialize_i64(i),
>> +            u64(u) => serializer.serialize_u64(u),
>> +            f64(f) => serializer.serialize_f64(f),
>> +            CStr(cstr) => cstr.to_str().map_or_else(
>> +                |_| Err(ser::Error::custom("invalid UTF-8 in QString")),
> 
> Could this be a programming error?  Like flawed input validation?

Possibly, but given that you have to create a custom error type anyway, 
I'd rather not special case this into the only abort (see the 
"#![deny(clippy::unwrap_used)]" in patch 4).

Paolo


