Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJr01-0004aN-54
	for mharc-qemu-rust@gnu.org; Sat, 07 Dec 2024 04:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJqzy-0004Zs-Oo
 for qemu-rust@nongnu.org; Sat, 07 Dec 2024 04:21:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJqzv-0005RY-UU
 for qemu-rust@nongnu.org; Sat, 07 Dec 2024 04:21:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4349e1467fbso18487715e9.1
 for <qemu-rust@nongnu.org>; Sat, 07 Dec 2024 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733563270; x=1734168070; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IC7m/KyPoRokYoUodJq+MoEsSQ+WiBEiUbDYQMEv3ns=;
 b=dy5IbicLxkl0HYmWiQxwtOpEQZDx0bvNTYycwBTKHeI32kjJwa5sbCRHbrmKf+Wic8
 mYg4oHks7ujExb8hs0Xog9MpoDP+0Hp0DQwM/2noQ++GBsWA/qZjnBxxgq9/6BnrX7V4
 1ezgPUftJ1n1TivgLkPFNiSeeM8M2D9dhN779YDrg9Jd9J+K1/pmqn7uQcnE7Rcm3LHx
 0Fh+Rl0PBWoN87x5CtJGRaRzyLzBrwlQkIjWxNUQISdDYqTrXPFwV7vjFOEPwSY5uzCO
 xp8smlvnwY4eue911bs2b1ISHNsJis6cBru5GYGCVd68v9JyCcx8eZbDMdhYDnCofRbf
 WZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733563270; x=1734168070;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IC7m/KyPoRokYoUodJq+MoEsSQ+WiBEiUbDYQMEv3ns=;
 b=psNR5fFwnRcolJAYqCw7SWOTgo1wK2l4tJL9yDv4y7ybfBeyw2EpR1P8ysjnbExB6b
 Ztc9Itqs483324uXF5jHJun1aPBrq+EbhgkbWAQLfsJACxZvnu/ItzFUsdGjV6PZSG+l
 sGMevLhIL3mRLfsK8NF8O2fYuxJg7kwjTXgG3oSRXEh30Sn3gcFHxk6OO+NxELc+r6Ij
 SHrv8EZudqZ7eSdPjpz7+Vg8A8TCIoJPsoSKeU3kKJYlzVztTtO9rGgSdPT8VV3b9gZ5
 oIJ3Ef3nox5vi0SZFAU4wLLwSqY2wFFbeLkfufZ5ZPwBVVHxs8Rff1TUWA847KkCrakR
 AJNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl8rlwLZGVfi8pk8B1kL2Jo6haX4XsdTVrfg7y1NTc0uvsMuOjAXAztmH26uS7SLXRi5N90ixMKkA=@nongnu.org
X-Gm-Message-State: AOJu0Yz8XCrqJ1T788OOdcMwyGuI/YWETr22KLatgg2LPYvREjCe5r7w
 /QD5qsBmznLw7Mczjdgez0nIf64pHbJ6p8dA310c9azhCTJM582m7BdxPUdZohQ=
X-Gm-Gg: ASbGncsUSOtauwK04Hb+KxyPBuI0yXaLR43ClbkBhTZDRVwM4RRmIx/tTIrcV6bpItQ
 EeQta2j4E1GmQAPHToYV1EGEJMujbWf3q3PH8MkRvm9ggXG27T3nfbL5apDC8hRkGKlD2uRKDOV
 UewdQnKEBh1w5y9OOAGIEZV6OZjylzi6rQXkPuJHztN3SNxAMjWhSZlklZ+PbqEZducTclyET2q
 N49FdyFugH7zTPN3d85Pm3ySh0gAMEtYf5598LulcchY6hGM7qzroE95O8JocQD4re4b+wNMGhI
 /pjhqjYeHsTGMg9FUk5IHisF0GTRyu05
X-Google-Smtp-Source: AGHT+IEzkO49rE7qjUB2YWYY8taJ0ME1Rwzp9yBdNq3rhhQWpGtSY3AN7rjrkgb0dQnMVMySs9XOjQ==
X-Received: by 2002:a05:600c:1386:b0:42c:c401:6d8b with SMTP id
 5b1f17b1804b1-434ddea7f1fmr49259665e9.7.1733563269929; 
 Sat, 07 Dec 2024 01:21:09 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d6a07sm79924405e9.13.2024.12.07.01.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 01:21:08 -0800 (PST)
Message-ID: <06e90014-40b3-4928-b61f-6598193151f1@linaro.org>
Date: Sat, 7 Dec 2024 10:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
 <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 07 Dec 2024 09:21:16 -0000

On 6/12/24 11:59, Peter Maydell wrote:
> On Thu, 5 Dec 2024 at 18:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 12/5/24 19:15, Richard Henderson wrote:
>>> On 12/5/24 00:07, Zhao Liu wrote:
>>>> The MemTxAttrs structure is composed of bitfield members, and bindgen is
>>>> unable to generate an equivalent macro definition for
>>>> MEMTXATTRS_UNSPECIFIED.
>>>
>>> I'm happy to move away from bit fields to uint32_t or suchlike to enable
>>> MEMTXATTRS_UNSPECIFIED be a compile-time constant.
>>
>> Yeah, if we go from
>>
>> typedef struct MemTxAttrs {
>>       unsigned int unspecified:1;
>>       unsigned int secure:1;
>>       unsigned int space:2;
>>       unsigned int user:1;
>>       unsigned int memory:1;
>>       unsigned int requester_id:16;
>>       unsigned int pid:8;
>> } MemTxAttrs;
>>
>> to
>>
>> typedef struct MemTxAttrs {
>>       uint8_t unspecified;
>>       uint8_t secure;
>>       uint8_t space;
>>       uint8_t user;
>>       uint8_t memory;
>>       uint8_t pid;
>>       uint16_t requester_id;
>> } MemTxAttrs;
>>
>> is still decently packed and simplifies things a lot.
> 
> The old struct is 4 bytes, and the new one is 8 bytes. We do
> a lot of directly passing 'struct MemTxAttrs' arguments around
> as arguments to functions (i.e. not passing pointers to them),
> so increasing it in size is not completely free.

Should we add a check to not pass 8 bytes?

   QEMU_BUILD_BUG_ON(sizeof(MemTxAttrs) != sizeof(uint64_t));


