Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tD8uA-0000lc-VK
	for mharc-qemu-rust@gnu.org; Mon, 18 Nov 2024 16:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tD6EN-0002y9-Mk
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 13:12:12 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tD6EL-0000ea-9O
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 13:12:11 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20e6981ca77so36387695ad.2
 for <qemu-rust@nongnu.org>; Mon, 18 Nov 2024 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731953527; x=1732558327; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oEe4aKYCCqICkCpHHVQQhZO5iDc/lYj0mFzN2UGt0QU=;
 b=Q+4JMhB2o6nBBHbgN2BpG2+HzLnjqovohRvRMUOM/OJO2DSP+u6RicWrmOY47SdJCD
 9SrP3fmNfRub2sVANe34P1KpDNIDo/qbbGejBb9Zz4w5ID4Zz7o9TZrvuQT040oSGqKc
 gbJTGI1k6vNY+HNXNDcmf6V3CkfFZVYpU4amT4yoE9bqzxsRXGie8vlpyHw1zDKVqSBl
 w2kU0lS/HUtI8Whv5XuxqjMt4iQSD6JxHzcq7cNq3sKQO0KhSYOjvaXY6QsdpOWnjjN2
 I+b/6R4Vx8nnTQRUhrIPmV91fz6nemPBOgLb1bj/7B/yu3wli85eWl/SCU4M+6ilj9H2
 ck6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731953527; x=1732558327;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oEe4aKYCCqICkCpHHVQQhZO5iDc/lYj0mFzN2UGt0QU=;
 b=hnICKOVJ/dYcu6rb3Hwl2SsxOMA5i5i0GZ5uFRrsB0bmFjxJOaZHSfvDnk5Pf/k6A8
 xM24xpCCyly5LYXDB8fIIxFL9u5868Mh72zCbYcrDq70kR/IraC59WxG6UbYccJV2jYE
 iHvDXtK1cEIL5J3xtBPJ9eMkcOmwv2vPyTsxlVGAPf/kS4CtuNdCzwUMNirbSWKYQQda
 s/5VlDU3IYK7u9/Mx9KcB33raR4sdXUT2Pb5vO5hPfCQAI+XPILInTwP6Lz35FmkR2SG
 7FptKCkWz8GL5DEb2btZvXvGt85vNiZQcy1LbFuU9hzUsT6rpU8zG9iFtWX/vTWZe3z5
 8WKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDaAxjGYD14UwTwdFgzCRcSqCcA0zAxdTORrDYY81tg3iUn1NvROzxk9Qv5tAJs+9xxfR9+lXE0Zo=@nongnu.org
X-Gm-Message-State: AOJu0YynIhWuwFn+0hgfyT8Aq1jshEein544gLLhE77k+69EAcmXYCm0
 SfiVC6eZpgYgDoN1dYh9SPCPvIEl0ftJTkgMe81vCVgOkwWU4Zi4IGoJAjIDU5I=
X-Google-Smtp-Source: AGHT+IHSJ2CzbkLZQ6mYUghdw6lw24R6B+3Ki9pAyw/aND8qpkQStUGSMwd/hokjCVVg/gmp+4IYNA==
X-Received: by 2002:a17:902:f60e:b0:212:4582:37fa with SMTP id
 d9443c01a7336-21245823ca3mr21334845ad.53.1731953527615; 
 Mon, 18 Nov 2024 10:12:07 -0800 (PST)
Received: from [192.168.0.4] ([71.212.139.183])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72477200e52sm6751269b3a.180.2024.11.18.10.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 10:12:07 -0800 (PST)
Message-ID: <54fa63c5-e20a-4fc6-9b71-d918dadc26df@linaro.org>
Date: Mon, 18 Nov 2024 10:12:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org>
 <875xoku5vd.fsf@draig.linaro.org>
 <CABgObfaVs-3aXKXtQRLDbzCL56gbimWZoMchYi5G+QGu8r0AxA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfaVs-3aXKXtQRLDbzCL56gbimWZoMchYi5G+QGu8r0AxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Nov 2024 16:03:29 -0500
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
X-List-Received-Date: Mon, 18 Nov 2024 18:12:12 -0000

On 11/18/24 04:40, Paolo Bonzini wrote:
> More reviews are welcome; in general, we should define a convention
> for Rust functions and constants (is it okay to rename constants in
> the Rust bindings if their C name is ugly? should functions keep or
> lose the "qemu_*" prefixes?).

If the C name is ugly, feel free to fix that too.  :-)


r~

