Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tqfbk-0000hy-C5
	for mharc-qemu-rust@gnu.org; Fri, 07 Mar 2025 16:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqfbh-0000hX-D9
 for qemu-rust@nongnu.org; Fri, 07 Mar 2025 16:51:49 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqfbf-0005Bs-0V
 for qemu-rust@nongnu.org; Fri, 07 Mar 2025 16:51:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so14311765e9.0
 for <qemu-rust@nongnu.org>; Fri, 07 Mar 2025 13:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741384304; x=1741989104; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VcglSgwL9d3YFt+EM1s5ZcGVoRNp/5wHt30Q6WrDCCI=;
 b=qs6Xt5eTn+KnUJPL4JNyWRMnZyHnXEK+7DWw/7NNP2BGwnPD756zIMQPy0JOj04Xvm
 cwia6OA+694n/ACj7kCkRzS7kygrnjJDWg9w38S3IRiIPEtM3BHdg7gfA6ZScU99649m
 DAnnzXjcKoODfeht54FSgwQuvNUchBnsxUwmbc6FgnO8pIiZsK6uNoR+tykHPz2AHiCH
 kHSNtRlN/uMS+4QTJS3jAR09d88TxK6x3U9VZP+zHjXD+hASFmBqxrQjCxR75QBSub+e
 bXBJH1+iYg9zJW0vT2x5yS3lInuQ6lQSZ+dssCRlaG8DiqiSS8+Mxq1v9x3FDr9RgJkI
 DS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741384304; x=1741989104;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VcglSgwL9d3YFt+EM1s5ZcGVoRNp/5wHt30Q6WrDCCI=;
 b=l5gdVaGuzrqAnhcgllV60EUrm/7L8Uuc8j5DY96Rwb76FNvIDaqX+WUJsEHXxLBNOP
 Dr4BbhLLPa5oqKPd0302CXPxcg8Kk+WZ62oT6MJImdtWff6t227dowop6Oa6O8a3IoXk
 /NXMW01eTksUcVq/AGZd8H42Vf6SAfeaqetUdv2sCCm4lQbyLt1bms10CDgaO+ozNAzT
 5iKfIN45IgiVgzHYe+2CO3ilqE0R26TAZmT6Sq89Yn683GaPncUXTiiFOCJEK3xRN00Y
 mVFPt5c7gZ18XOfwMhR4BcMr5QxTd8eBF0GoH6qdTvUubnC57UJD8UGKEMZEvPrwg34i
 zFkg==
X-Gm-Message-State: AOJu0Yy5VnYA2CAbxft6RX/QrvZHDI2AZyyI27ogo5TWhoymJO5Limzl
 2If3V4VCBsWyVPBTJA2EBCMBgJtpt8QkOkwmRfHIPqGOqzhOW0689wcBOrh8YXk=
X-Gm-Gg: ASbGncvolNuEjv1/mi+2xgrdTjx5sAzCbmzDlaHproFE6Z1OntxtAHP5hoLO5+FkGts
 Nhf/9EkE+VDCCGcWwvQgJYImHYofj6vELtOZWG48/78d7715ZMuYCg71en5ZENjG/IG2HD1Twwj
 w2L8nPZ/4QG+FJXlY6S7vK3DYBKLT9Y+Oy4Gji3jqneiNgqweCIhPHo2hZcFxzLIG+ubuGJVpsq
 /ux1fnVIe/Ohpejzrc5OnUnsEk6dSAsSVkqW0R0L9LiUI7PRO/Yun4+giSPL5S3XhmT1ZBYmgGL
 f4PkfwA9PFF10UND4MdDJroXGIGi9Z+ZUo81ybpkElx67J8oAn6K/F9FQKK2TRsjll0fODzqxv1
 z5I/GrSj86MD1
X-Google-Smtp-Source: AGHT+IEyUVaXQu4EF0C5b/5aTorUNwP4/tS+13vAPKUeCVjbuqmh+xdlynLFipFwyhLadw1pz+YqZA==
X-Received: by 2002:a05:600c:1f92:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-43ce4dcf8e4mr6258045e9.12.1741384303692; 
 Fri, 07 Mar 2025 13:51:43 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdff57sm6719302f8f.37.2025.03.07.13.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 13:51:43 -0800 (PST)
Message-ID: <b45cd704-67e5-4b5d-bf4f-9907693c4b08@linaro.org>
Date: Fri, 7 Mar 2025 22:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: pl011: Allow NULL chardev argument to pl011_create()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20250307190051.3274226-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250307190051.3274226-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Fri, 07 Mar 2025 21:51:49 -0000

On 7/3/25 20:00, Peter Maydell wrote:
> It's valid for the caller to pass a NULL chardev to pl011_create();
> this means "don't set the chardev property on the device", which
> in turn means "act like there's no chardev". All the chardev
> frontend APIs (in C, at least) accept a NULL pointer to mean
> "do nothing".
> 
> This fixes some failures in 'make check-functional' when Rust support
> is enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is my first Rust related patch for QEMU, so I've
> probably got something wrong here :-)
> ---
>   rust/hw/char/pl011/src/device.rs | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
> index d0857b470c9..8098f762f4b 100644
> --- a/rust/hw/char/pl011/src/device.rs
> +++ b/rust/hw/char/pl011/src/device.rs
> @@ -713,10 +713,12 @@ pub fn post_load(&self, _version_id: u32) -> Result<(), ()> {
>       // SAFETY: The callers promise that they have owned references.
>       // They do not gift them to pl011_create, so use `Owned::from`.
>       let irq = unsafe { Owned::<IRQState>::from(&*irq) };
> -    let chr = unsafe { Owned::<Chardev>::from(&*chr) };
>   
>       let dev = PL011State::new();
> -    dev.prop_set_chr("chardev", &chr);
> +    if !chr.is_null() {
> +        let chr = unsafe { Owned::<Chardev>::from(&*chr) };
> +        dev.prop_set_chr("chardev", &chr);
> +    }
>       dev.sysbus_realize();
>       dev.mmio_map(0, addr);
>       dev.connect_irq(0, &irq);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


