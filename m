Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCzEO-0000aI-7r
	for mharc-qemu-rust@gnu.org; Thu, 08 May 2025 07:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCzEK-0000YI-Em
 for qemu-rust@nongnu.org; Thu, 08 May 2025 07:15:57 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCzEI-0003Kl-Sa
 for qemu-rust@nongnu.org; Thu, 08 May 2025 07:15:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso887069b3a.0
 for <qemu-rust@nongnu.org>; Thu, 08 May 2025 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746702953; x=1747307753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bxvXFK6wyH800bbxULSduBDyAO1im3t1VVcC9kc1l+0=;
 b=TnXEcabEnVOnLABB2QUCm3NdrsIKZzQn3lu3ZDgku8kv0QywapGunBg2A4Rvo/nBlu
 tjElQjnraZkJoLy2bB1eTGzWevTg1wxeO+5r79/uUornFJ/n7gZE1sL5SiBq4FVHKSf8
 a/tpBa+lEhWilLkBU5EySwYKNtpUwSM1NwXucKxY1IFKO5VKPME1/buNdWbKc1vZ0vUY
 XS8qPJyRkBNRVRekVXWmTmsTPbeUbUadX40In3ecqCSyh5w95A1o4mNIb5mcgGwhbWm8
 VfS3qreggnxT7U8eT1venm09T7JENQiMq0YUl9UPeamo3d54hWV7jp2ltc6wv3UcFn6Y
 jgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746702953; x=1747307753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bxvXFK6wyH800bbxULSduBDyAO1im3t1VVcC9kc1l+0=;
 b=COe1YBm3xxUrWy5yD6jm+VQB7ePpiFUS4TLbhj+twb2GPB/XrRRSFeA8k2PxekO8db
 0uDQAMwVk5SCgwkm2iTA/oB6swYzKoJgjJKBm6wsD6MKvPbvE7lwLpNptSKPZ/7hiMI1
 RbCzG2qf9y02bnOX2xbSSYMCw5UyuUrnFrG0/wAEOfP3wIRJYvb0zRPyv3Ue75uX04lo
 1b79cXwhC4H8/telTqKoP8T8TPgkOBaUf2WYpd21YCWlRYbH7PDKfY2EOuCrQtgspmUM
 lpNMoSx2kyFtAH1jrB5wtKu14VX4q5tPEAvb1T18x7crPDlWEqI9A5qqQDhTyKr8VYMB
 Dkvg==
X-Gm-Message-State: AOJu0Yz5lVcHXrrMmuIuUMex9k5eQJKSzsKYHy3CncOp41DDeT7MdAyt
 OchX/tImLTzTD+miyY8WYTI/gnxBeBOnu11ujQvrTDTzq1R8hiPn7C86++knPSHOHnaukSKAmYl
 ShXywIw==
X-Gm-Gg: ASbGncvULEiTvfOp35ElUiFBVISZh1QeSWOvIjpLNegfMPOPVEaDB+171NaVmxnc0v4
 FZVnOWNOb3qMXv+NBOxgaZXvXPuOlqLFSKCYidBICkXIQMfhP9qqWWthAwHigNAWKZnvD0Gn63g
 W8UCRKX4fsQX29PCOa6iRXVTtSvmZQDAa6KTBkqGh7/dfP/FD9+PYHIvtVZlRM96I5uoe1EWYwF
 5iZFjNBUAWkqaEnzakUqnejeWv4PWV/YuFX/HR3fTBot995mxkUsX2HcdfRx26gkEsqdrtgGd1r
 nFfpbKZBG+9L/qfxgxDcmFLUMnXznPecJ/I4FdHJN1BqA1UXMzcFdgy4oIL607X44DPtZjg7oGn
 MyMlxaS7DPqkD4KAdgow=
X-Google-Smtp-Source: AGHT+IFawoyvGUHhnXP+m8rwiZuJFX+G7XNa+3Yms592k8ITLyMfvseOoFC8KzPpFvrhHD1tRLW9Ig==
X-Received: by 2002:a05:6a00:2c86:b0:73d:f9d2:9c64 with SMTP id
 d2e1a72fcca58-740a947b507mr4637639b3a.10.1746702953214; 
 Thu, 08 May 2025 04:15:53 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1fb3b5113csm11119773a12.18.2025.05.08.04.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 04:15:52 -0700 (PDT)
Message-ID: <90356173-31a1-48f7-9eb8-7a9068b167bf@linaro.org>
Date: Thu, 8 May 2025 13:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: pl011: Really use RX FIFO depth
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20250508082943.446512-1-pbonzini@redhat.com>
 <20250508082943.446512-3-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250508082943.446512-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 May 2025 11:15:58 -0000

On 8/5/25 10:29, Paolo Bonzini wrote:
> While we model a 16-elements RX FIFO since the PL011 model was
> introduced in commit cdbdb648b7c ("ARM Versatile Platform Baseboard
> emulation"), we only read 1 char at a time!
> 

This comment ...

> Have the IOCanReadHandler handler return how many elements are
> available, and use that in the IOReadHandler handler.

... is not relevant, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/devel/rust.rst              |  2 +-
>   rust/hw/char/pl011/src/device.rs | 14 +++++++-------
>   2 files changed, 8 insertions(+), 8 deletions(-)


