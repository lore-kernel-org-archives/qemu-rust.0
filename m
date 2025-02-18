Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tkJbd-0004xZ-45
	for mharc-qemu-rust@gnu.org; Tue, 18 Feb 2025 04:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkJbc-0004x7-1O
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 04:09:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkJbX-00067H-8u
 for qemu-rust@nongnu.org; Tue, 18 Feb 2025 04:09:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394a823036so54271305e9.0
 for <qemu-rust@nongnu.org>; Tue, 18 Feb 2025 01:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739869761; x=1740474561; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XtZ35Q9HXYGYqMuJlD0ubU1N+t7pPICndc/oTot9foY=;
 b=ig7j7Xr7dN6+YeNPqi0jCRSMcb92LraThj9d/k96UkY2xFi+bTZqt4bv8+xpNEux+Q
 2nwk9NYz3NzO5R6jYUcMQdX4Jmn+7rRell7Fk/Rsi5VB74vhe5uiSmhcSru28rGbx6Lv
 jBJIzmbet/Dtj2zAdQE7UBY2VpihzonPDk9jtUSHL3sWAt2M2hebZ/aDl/RziEEMMcRY
 qXnZJ8YydeQMRFMvzVPZlLdJ7csJYiZlosO+DZHa/cLlES/skXTsdCr7I7vVU0tXpsAe
 IYUlQCAJ6xQ6DAKqA9yONdkLLCX2qp76mEXu4fs52aMz2jJ6boQ7NKkBxkTJceGz6pz9
 R0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739869761; x=1740474561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtZ35Q9HXYGYqMuJlD0ubU1N+t7pPICndc/oTot9foY=;
 b=X/1WV1NTdUJlsyL7QomnCYyqMihAde8KXxbBcaysKfx2GFutCQaiRnuoLmnoTooxYX
 7RZofR6PJIqNerALGKDVYYhwOi62ErRcxF0c+ifDdlIlqurlnnGrmsAL7V2b7LNYQAzN
 44vAVSwi9zE66lDzPtSxC5RXSs4nMp8xUTrcQWiHoc6aiZqzzsS7lgY37YztMw4f8V7F
 jd062G4AAQ5s/7w4zy+hyqNCVjdHEoGb4e9tKnPjzERAA2rknNw1sapz0ldP8IGDWHZV
 95Eb9gTOF4eSp8jTELQNqcWrBLT2a53Ji7TF+9cGrxlCq1VOhXsX1PZNQfMJO1l4r4aX
 X3xQ==
X-Gm-Message-State: AOJu0YzTd2QfLo+eWDYrRCsT+pymUzFlnIrv7Lc+E+xJ4qR7vDuFdaj6
 uP6K2WKDBYjOH44t9Vu1QYPwRkpt67m5x2Nsoatls2vcAFtAFgnW/9gsn/Dgih0b9GnDpjxzujM
 ZkIs=
X-Gm-Gg: ASbGncsFKTJlSVCEwgatfUv4l5qhuKtVVUOlJMD7wxCHYH3RE5AGSB9IpVlqeDZHYEe
 gOOM/wC3c29TopCjBkOJTfLKIAMiluiXg6IMWNm+aZ4f91PAXeM5P0IcbVZOHsqwOPGT8iI9GDK
 TryaT3lCiC4YfDQ0q+KEsuewTF53QbWlDhboluyJBoFrflyQQodELcCuN1mePsgENBsdDNXO44s
 5VID4qTNxoJiMMkJNBgf1+5N9YhoeG4OlNyOKNS8h2r6LJty4r8u0DkNql7sULh60LTygBHpZEF
 paEOEu5KLHTxxOfo+UZJcXUROgkb0+pTRA9FnSd7L7QGjvwhEkWzyQJpexE=
X-Google-Smtp-Source: AGHT+IF7KuaKb1OXWfYidgO2vHMFry6rIIvGnkJhqu2/1yEv/lgxypCckJK5zU8Sgi07Lc/t018oaQ==
X-Received: by 2002:a05:600c:1c9e:b0:439:88bb:d013 with SMTP id
 5b1f17b1804b1-43988bbd395mr51870515e9.7.1739869761223; 
 Tue, 18 Feb 2025 01:09:21 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43986320899sm46802175e9.38.2025.02.18.01.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 01:09:20 -0800 (PST)
Message-ID: <b92a2d72-7cbb-4a70-ad73-0af8150c0a8f@linaro.org>
Date: Tue, 18 Feb 2025 10:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: rust: fix typos
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20250218080458.426402-1-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250218080458.426402-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Tue, 18 Feb 2025 09:09:28 -0000

On 18/2/25 09:04, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/devel/rust.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)


>   By conventions, procedural macros are split in two functions, one
> -returning ``Result<proc_macro2::TokenStream, MacroError>` with the body of
> +returning ``Result<proc_macro2::TokenStream, MacroError>`` with the body of

Isn't sphinx supposed to warn for such error?

