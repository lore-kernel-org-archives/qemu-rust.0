Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJLdP-0003P7-PP
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 18:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJLdO-0003Oj-33
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 18:51:50 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJLdM-0002pZ-Jj
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 18:51:49 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-29e3721ded9so1039929fac.0
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 15:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733442706; x=1734047506; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1K1UUAAPycuvo3k7OdGUNpRaHskryB+3uYoZ9vNA/As=;
 b=aakSbDzT2bt0ragDG67PCkibLqACQG09EoBOw2X55pUY+Gnc05ZGeIdtN4pQJ7p3Tr
 Ad7ntLAMCPNcnnb87Sxp6vBOFQG+xjuKdNZZISf6j3Kj3bSJosBccd78VSW1SEOgcH70
 b32BcrvVoLkLQwWDNysvkMw42gsYjnRcNNWP+w8/1/QRl3gDcZSd2nZNRPvED+x8dwqG
 /vov1KNQQvhSu1DNls86mxjxCvhETqrbauxWUBHJQEYF20TRcZ7kgfBNhFADw82hqiEs
 wj6cvvjjfmHJvyW7UB7RuDNTu3JV8fk5eKTGmXWCCcEm9rszxB70FTHbJinJ7NaAzwkH
 fGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733442706; x=1734047506;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1K1UUAAPycuvo3k7OdGUNpRaHskryB+3uYoZ9vNA/As=;
 b=N0SgZjlL6VryKvsagaBO70dTaZ2kxzSrXbnQR9AMEAhNsKJfVyNpOATlz1bwrmX3Zs
 bMiU00RKJbajqoVCyak/sd9q2bjEUyzBkZmNW3Uzxkh7NZEH7x6B1rrn0kDpZu8SEu+y
 lzGIeCqtMy5fiZhAcT0c/JNrjtpzybCYJPnFS//XaIXiSimWc5uheJB0Gw8EQvXWm8wu
 hW8+Tz3Xtf4n8WOfIDdJ1HrXBa9DVZ+dgXi8F70HiuVFgK7VfuKZwiRkXHpDit8HZ+xO
 ZB8gIHY3YR0GebLXGi5Hv/WO2XsUZpdTFBb8gXgGhEWY4TUIRuJCngGeiloVFSMNENa/
 QnbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtcKsxRwGJ1cu4HEiDwMzx46bC0YVpPoBV5voNwl1Y517YW1eQeYCWgz3dkgXy5ArOqsSpToow0G4=@nongnu.org
X-Gm-Message-State: AOJu0YzE7upRE9/ltaWDATP8/RzmV1xiv3TlgfGEieatz+3sBxLMadV2
 VcKZdVMaSJAl2f2Vyc7XGQQOPL7PtrG0nZ+sdZKW1q+F6Wzs7jgvVvZv1Tjx5Y8=
X-Gm-Gg: ASbGncsaA8j/D+pOQH96j4Akse8erIJXQhWvbyLSRyKi6KxS9mMTD5N/xQbAGdEUbT/
 IajKZvG4sQTmwhZVMcZkRBQ48uQIDVNgttyDnLFpT0ha3tdeA2+dicRZYtikQAqMZ5FAN78MbcM
 ZYppgNj0PPSZWsGdEwo0OWWMoYx8oT8CLUUDDG3fORVCLgTq5bmYDUZryVkQW/fmrZ0dXW44ECE
 6+a6essALmuX91++FJXwi7IxCNzZTMr+9ZlWgzcdtB9vQA0IW4KDRuUu74qYfnm0n0vMbIAHHmg
 ptNJY/NH/m7aXX6tTPLnkLGXPDTD
X-Google-Smtp-Source: AGHT+IF9tCijy1YfMXohB0O+APlNGmsExWNhLDvgQxNE3rDlh2oq9VvhwZlr1UjHnS3Pl/CHfIO9iQ==
X-Received: by 2002:a05:6870:3d95:b0:29e:6117:bd45 with SMTP id
 586e51a60fabf-29f734d1022mr1160296fac.31.1733442706326; 
 Thu, 05 Dec 2024 15:51:46 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f5677528bsm586144fac.28.2024.12.05.15.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 15:51:45 -0800 (PST)
Message-ID: <edfa85a7-2963-46d8-8b02-4d22ec1aeee6@linaro.org>
Date: Thu, 5 Dec 2024 17:51:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Thu, 05 Dec 2024 23:51:50 -0000

On 12/5/24 12:30, Paolo Bonzini wrote:
> On 12/5/24 19:15, Richard Henderson wrote:
>> On 12/5/24 00:07, Zhao Liu wrote:
>>> The MemTxAttrs structure is composed of bitfield members, and bindgen is
>>> unable to generate an equivalent macro definition for
>>> MEMTXATTRS_UNSPECIFIED.
>>
>> I'm happy to move away from bit fields to uint32_t or suchlike to enable 
>> MEMTXATTRS_UNSPECIFIED be a compile-time constant.
> 
> Yeah, if we go from
> 
> typedef struct MemTxAttrs {
>      unsigned int unspecified:1;
>      unsigned int secure:1;
>      unsigned int space:2;
>      unsigned int user:1;
>      unsigned int memory:1;
>      unsigned int requester_id:16;
>      unsigned int pid:8;
> } MemTxAttrs;
> 
> to
> 
> typedef struct MemTxAttrs {
>      uint8_t unspecified;
>      uint8_t secure;
>      uint8_t space;
>      uint8_t user;
>      uint8_t memory;
>      uint8_t pid;
>      uint16_t requester_id;
> } MemTxAttrs;
> 
> is still decently packed and simplifies things a lot.  Zhao, can you submit that as an 
> independent patch?
Hmm.  I'd been thinking of uint32_t and hw/registerfields.h, but I have not scoped the 
size of that conversion.

But short of that, please use 'bool' not 'uint8_t' for those single-bit flags.


r~

