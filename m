Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tp78w-0002OM-Kr
	for mharc-qemu-rust@gnu.org; Mon, 03 Mar 2025 09:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tp78r-0002BZ-Bc
 for qemu-rust@nongnu.org; Mon, 03 Mar 2025 09:51:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tp78n-0006Vq-HH
 for qemu-rust@nongnu.org; Mon, 03 Mar 2025 09:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741013491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r6kKs2VKcDYFe9P1iLTQMG3USZ1cNcl9KptsP8PUt2M=;
 b=W9HFhrq8WN2+oVpF9tD5/MT0a54vt1uGnHhLBDhgOGmAkBat0XdGogIUAENdcahTOf5VSS
 6cIpFtOLpe7T+IzVXUhjLP3WXUeRhLqoWmvnPVPN2oj8z5xfZHPkPVovVnDcfxAl6ZJWt7
 F/fK3OKxHsI4QlILdElSliXNo29EQt8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-wwgf6Yn7PGmULjoOJGQMhA-1; Mon, 03 Mar 2025 09:51:28 -0500
X-MC-Unique: wwgf6Yn7PGmULjoOJGQMhA-1
X-Mimecast-MFC-AGG-ID: wwgf6Yn7PGmULjoOJGQMhA_1741013487
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4394b8bd4e1so20274355e9.0
 for <qemu-rust@nongnu.org>; Mon, 03 Mar 2025 06:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741013487; x=1741618287;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r6kKs2VKcDYFe9P1iLTQMG3USZ1cNcl9KptsP8PUt2M=;
 b=QCky4euUk4SqyXQv46s95cJhCTPZkjhF1Tc3fkVrXH+XqlKmf3vY9ECc4vIDvI1Kv5
 HPI+uYpgL8VySicod1biWQvEsFyli15Agw3Ji0aJIRvOqGm66k07VoSweTvdJB5wQWph
 GeI6Odm461OGwNDABh3QeRijadd5Z3WVzfiCK5AsVjf8aq7tsEuLWMqwUPeNCPNs1Thm
 6SH1ErMNicxQTC9lbUJVK5HvQhHx7gpg8DosrfP+1CgWyf+PQ9Gnle4ZSTAMq5+5pbdo
 vpSyv1K+vytDIz1SpSr7K+0BCLWIYbrbMUQY1/AXrTzkcduULQ/Fhr2LrfFtSzuCGxCh
 100g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVshQ04pbwWpOVUoaA2NyywvPM+68pSyevp9cjXjaPcPE9zQ8xaVqOITtHsnDNxGNh6KO8EkL4/PgQ=@nongnu.org
X-Gm-Message-State: AOJu0YxKIi9ShL1QA4BnCWnE+O8zrFoGPFcdloChSQ3nllgyYlzdcv/p
 dtKD5+qVjG8wXXWu4Llp/59U/Wn0jjmdJMRZMe/4hZfugsY2aImE35ybyUQmwt38/4NHffEQAoW
 Ha8UM44D5EHCgJERmoCPLjkD6yfwRRZpXBsWCUhjaXdNWRUaxVvE=
X-Gm-Gg: ASbGncsALfrjvowevd6Qz29v8SOf4RCNhY2wGT26Wi79uTed7MwEPZw2PO+ugAlNnHJ
 SsEX3P/CiSpvJ/IVoVRXqOG+rJg9qLSrM7B0a2ifGfYkdJmd4hE3pKVNGMbThFLh1Q4kZTM813y
 /vzuGh7kbQCQqAMRQ+MjASnPPdZEB7d0m02jPpUKwwMm0dI0jnfPw3XdItoh0buM8hmjwKlk+Q9
 vXChuGYMup/Ba7HypqefJMzF4jdYRQ0L7ZujOh2q/2SZCDXKhi7HJj6BdGVglnGWnwwvtFF9qPu
 Nu7Sn2sWR+PV0bpwv3I=
X-Received: by 2002:a05:600c:5106:b0:439:9496:181c with SMTP id
 5b1f17b1804b1-43ba67745d4mr119272345e9.29.1741013487355; 
 Mon, 03 Mar 2025 06:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxdtsjk6QfcKCQkHQfYfAEU0CNTLvHVwGilXAEvzW3gI6oKxES549fTdESaN7XHRnU8cRGvA==
X-Received: by 2002:a05:600c:5106:b0:439:9496:181c with SMTP id
 5b1f17b1804b1-43ba67745d4mr119272165e9.29.1741013487072; 
 Mon, 03 Mar 2025 06:51:27 -0800 (PST)
Received: from [192.168.10.48] ([151.95.119.44])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43bbed8b26asm52305425e9.22.2025.03.03.06.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 06:51:25 -0800 (PST)
Message-ID: <4b4ca8d8-662f-409c-96dd-11c5075252e2@redhat.com>
Date: Mon, 3 Mar 2025 15:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] rust: timer: wrap QEMUTimer with Opaque<> and
 express pinning requirements
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250227142219.812270-1-pbonzini@redhat.com>
 <20250227142219.812270-5-pbonzini@redhat.com> <Z8W8hzFO9HU3IujQ@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z8W8hzFO9HU3IujQ@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iMFHM71dpcjpLKpTqym1QumlF3UtINvXglrvTfkCLZU_1741013487
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 03 Mar 2025 14:51:39 -0000

On 3/3/25 15:28, Zhao Liu wrote:
>> -    pub fn init_full<'timer, 'opaque: 'timer, T, F>(
>> -        &'timer mut self,
>> +    pub fn new_full<'opaque, T, F>(
>>           timer_list_group: Option<&TimerListGroup>,
>>           clk_type: ClockType,
>>           scale: u32,
>>           attributes: u32,
>>           _cb: F,
>>           opaque: &'opaque T,
>> -    ) where
>> +    ) -> Pin<Box<Self>>
>>           F: for<'a> FnCall<(&'a T,)>,
>>       {
> 
> Ah, the lifetime here isn't effectively bound... However, I also
> referred to your latest code [1] :), and it seems that this issue
> has already been fixed. (Nit: The code still has a complaint from
> `cargo fmt`)

I am not sure if the change I have in that commit actually does 
anything, unfortunately... :( which is why I wanted to use init_full 
instead of new_full.

It's easiest to marked new_full() unsafe for now.

Paolo

> [1]: https://gitlab.com/bonzini/qemu/-/commit/ccb9f6dc738f503a696d8d50f1b5e4576ee80bc6


