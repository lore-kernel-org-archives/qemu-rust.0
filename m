Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNuL9-0002HH-NC
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 08:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNuKV-0001Jg-Fv
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:43:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNuKR-0005ex-Lj
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:43:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43618283dedso62923635e9.3
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 05:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734529386; x=1735134186; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BpfgCgqmjRnFtWOFA/8n5tIUZ3UhRJDzx4+XUahnt+k=;
 b=ABGGdBImiLaZ6L3zboa0U3yca+vFQPHKIxCZBmQ0rf+Fz+Y4glmLai0MXCp/WHJg+q
 sDd1ehkEpM04TT/YKXWQ7Iqx1QvwsCrw/J6eX/KSnsO5xM24AHcqeiuK6khlxHPs69ue
 eyFp/q29jdVnH9YxAykbji96iBgsouuMOYZjPu35ldDdSBXfg3cxDxh2+k9K+8GJ/GOn
 +IAyaX0ThhR7+jUd5lE72CCa+8a/IyGGvO8+/f9XOGwaNNf0SWPfms3s2JsezrjV4wth
 t6sFq4bP2XdgivvPCixI9i79B7YP9viezapkLeEsGtnvB8oOIEgatXafTkt5MPbHtQDG
 jKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734529386; x=1735134186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpfgCgqmjRnFtWOFA/8n5tIUZ3UhRJDzx4+XUahnt+k=;
 b=RqaobkhqnH3x7quenwfPIg8jYfzn7grk5KbVAralf4UWtynp5oNC2AUBzjt6mBH2Hh
 7EkxzveIcy1O+IZoWGP/L6RXoCQPOmIDPyZ8zosDiVXpy576b99Lcv1X9yV2G2BU6Etz
 56m9JJkn5yPptQBtqczCwIpCAnS64/8QODem3JyIfsQ6vjRiPEV4eHsI3g5dPjTgfj2d
 MqceCUbz4L6YIa5TDkt7/rgfpGcOlaPjSYNcpxasA7bbn4d0TyeMXlPRrn9tPdA2OiCC
 VH2Sboi/fU5rgeGQWXf5HKh0SBFT+85y6NT2LLyzGRXDRbp6jH5f6b8pMGeFIJ2ERBnl
 EIhw==
X-Gm-Message-State: AOJu0YybJ6w9UymGiQ0Tu7wBSZGvX732Q2Fah5wSN4DEZIUcW8g+JPvA
 No7cbb8tPceWJwIEO1zklxalVGPLy1Jjjy5GcSdg6384v93q4yoMZrHh2Dzrq63vzcrkyrZGbfx
 S
X-Gm-Gg: ASbGncsSop4CTxrUL4+ozEeMTgoZVd4HzPgjR9yzKeTYBfueLyVrW6IDePQ2JbShjIf
 5ppxD2WLMG9Ttlop+tw421oXhD5r/l3WHoubgwM1KyQ50KhLx3Ec1Ay9CIF6piXjL68LNZgcRnE
 lgrd7umFaaBlqIxU9VncKFZQCxotMfJ1tmSrTTCtVYu/pJnsE9SVSR3O356Mo36/9qQAEVpFuVV
 lbWJJ5ELfYyv/RImgyfDFMZhfJCzfCDHBB7OkrokHYJJNnDvg76TPmXLRwqnG5c5fnIG4fQ
X-Google-Smtp-Source: AGHT+IGMDVw0UvdLp/ZKIs8ScGhZu8pCTr4YSAgP21wA6B7azBCoRNbI0hhp4SbT+lh1tmWs6Gghlg==
X-Received: by 2002:a05:600c:3b0e:b0:434:9df4:5485 with SMTP id
 5b1f17b1804b1-436553ff1ddmr23633015e9.32.1734529385746; 
 Wed, 18 Dec 2024 05:43:05 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b12498sm20622655e9.21.2024.12.18.05.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 05:43:05 -0800 (PST)
Message-ID: <b51dfeff-c567-4f21-95ae-59a59f371085@linaro.org>
Date: Wed, 18 Dec 2024 14:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] rust: pl011: extend registers to 32 bits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20241212172209.533779-1-pbonzini@redhat.com>
 <20241212172209.533779-6-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241212172209.533779-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 18 Dec 2024 13:43:14 -0000

On 12/12/24 18:22, Paolo Bonzini wrote:
> The PL011 Technical Reference Manual lists the "real" size of the
> registers in table 3-1, and only rounds up to the next byte when
> describing the registers; for example, UARTDR is listed as having
> width 12/8 (12 bits read, 8 written) and only bits 15:0 are listed
> in "Table 3-2 UARTDR Register".
> 
> However, in practice these are 32-bit registers, accessible only
> through 32-bit MMIO accesses; preserving the fiction that they're
> smaller introduces multiple casts (to go from the bilge bitfield
> type to e.g u16 to u64) and more importantly it breaks the
> migration stream (though only on big-endian machines) because
> the Rust vmstate macros are not yet type safe.

This also better matches PL011_OPS::impl_.

> 
> So, just make everything 32-bits wide.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs | 36 ++++++++++++++------------------
>   rust/hw/char/pl011/src/lib.rs    | 23 +++++++++-----------
>   2 files changed, 26 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


