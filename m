Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvLQR-0000Mo-EP
	for mharc-qemu-rust@gnu.org; Thu, 20 Mar 2025 15:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tvLQG-0000L2-UA
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 15:19:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tvLQE-0000Bb-Lv
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 15:19:20 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22398e09e39so25378345ad.3
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 12:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742498357; x=1743103157; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tq5F+LFSz7I94wi2CXsI0zOfb8GaJ/jWhQMTyC+MdfY=;
 b=O9BhWGpQr8Zn9TNXhJlxk3rutFMSRSvyLZiZX0ZcimTl1f1wocjFx8az+ODpYZuK0W
 eGFzwynqF/9u600OVRe3WzrzSXjMWWP3ypzxYrSv97SCEfyYh+VfGg12tHDSqGB4LQTO
 I8QX41Ue+sskoVJTUZtvMEznRB9O156L6fES/dl9ZXeOIfCyEChcExNdUx0e3SW8Dimz
 SXMiYpnslqM0BNgcDwziHQ+41Kwv8h89Zba2/kS/LG1zGFP/8C26V7pkw67w0efzy2ny
 XigRSM/NEMYq5062qhegUj+Fe1/gJumlRQRuutI2RKDP7pQL9Y8P6HO+HicMChArDyq9
 191Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742498357; x=1743103157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tq5F+LFSz7I94wi2CXsI0zOfb8GaJ/jWhQMTyC+MdfY=;
 b=e3ndJo7wX0rZZYjEfnJm6GVM3OS40WgAtZaxS/I+cBerepNV5rzNwX5hUp8JN67Oxj
 jUAABfs0BruuQBFgactIiuaawg4XV+wtqCbEDUomEV6v+eqCW/i4Om1RDUA4hbYsIyOH
 R/odpBH+A1Qs9Du2gTqWIl54+bqYvm+gzgYtONzvkj+hA9nRqwVt+InljFxh3nTPithe
 SZmeWvFzGWPUY6SgIFiQOR9/97Yafwq6LrS9T/g6BLgpHCsPjeWksN7WHwI74DGmQIrJ
 EuXT4K01LP3RerHZKfJBxq4C667ySDKMKwsTPUR3wXGIdYle428a3HF3k6csyiMXa0YM
 dlrA==
X-Gm-Message-State: AOJu0Yw+vVeAlTm9fwEh0aZGnFhx1CGHsbXTkyLQlmtRuZQr/yrBFJfC
 kVant+rkKFCjw5sgfzPUhQkLz1+m5OtAXJkijoitDxb4kAQJClgA1SBRQmKAinigjuUQBuZR9W+
 h
X-Gm-Gg: ASbGncs65mV9DHmpZz751obg6K41IiyxyAW2fn0KNZNTG0yPQcx1yeUrWNK5GRupL7f
 aGeULXze+Mk63nODPra+3TAPGK6Phbyy4DADvS8jsplUAtvpWpPcNm+OUNkPVcDUgW7dyGp8pL5
 Y+fQoRUenQ8wJP7+wiCsJA+Hkwk/Z7QAb00Ujii0mzn7mBCDxPazUaNeflbiby5jxATsLvNYWo8
 sF7L0UvlBr+PvHfn8ItRvS7oUC0hfmbqQsqCUndMKaD5Iu2pgeqN9B2akQXDNAE1Q71IBCx3A8+
 0jacRT+DOOcFB/kwQ9/23CqPKifHvwClkUT67jglpcDrPi74ABKnf7whXg==
X-Google-Smtp-Source: AGHT+IHnxwSgcecrpXyfAh4nU3RDQ5gC7c6RX8ocuRb2dcZ8am6818rs0+JuCbrRatAoRrsb5qQzlA==
X-Received: by 2002:a17:902:ebc6:b0:223:39ae:a98 with SMTP id
 d9443c01a7336-22780d825c4mr10603855ad.22.1742498356861; 
 Thu, 20 Mar 2025 12:19:16 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811f45a7sm1512305ad.223.2025.03.20.12.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 12:19:16 -0700 (PDT)
Message-ID: <79b3715b-c8e8-4fa9-8bb9-d675a56be7d0@linaro.org>
Date: Thu, 20 Mar 2025 12:19:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: assertions: add static_assert
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250320115521.808019-1-pbonzini@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250320115521.808019-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Thu, 20 Mar 2025 19:19:21 -0000

On 3/20/25 04:55, Paolo Bonzini wrote:
> Add a new assertion that is similar to "const { assert!(...) }" but can be used
> outside functions and with older versions of Rust.  A similar macro is found in
> Linux, whereas the "static_assertions" crate has a const_assert macro that
> produces worse error messages.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Supersedes: <20250320113356.799412-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
> index 104dec39774..bba38cfda11 100644
> --- a/rust/qemu-api/src/assertions.rs
> +++ b/rust/qemu-api/src/assertions.rs
> @@ -120,3 +120,25 @@ macro_rules! assert_match {
>           );
>       };
>   }
> +
> +/// Assert at compile time that an expression is true.  This is similar
> +/// to `const { assert!(...); }` but it works outside functions, as well as
> +/// on versions of Rust before 1.79.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use qemu_api::static_assert;
> +/// static_assert!("abc".len() == 3);
> +/// ```
> +///
> +/// ```compile_fail
> +/// # use qemu_api::static_assert;
> +/// static_assert!("abc".len() == 2); // does not compile
> +/// ```
> +#[macro_export]
> +macro_rules! static_assert {
> +    ($x:expr) => {
> +        const _: () = assert!($x);
> +    };
> +}

How about using something already done, and exhaustive for this?
https://docs.rs/static_assertions/latest/static_assertions/

It provides a lot of convenient asserts related to types, traits, and 
configs, which will probably end up being introduced in QEMU Rust at 
some point.

