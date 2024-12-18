Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNu6R-0001Tm-RY
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 08:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNu6H-0001Sy-3v
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:28:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNu6C-0008PM-85
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 08:28:26 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso67286925e9.2
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 05:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734528502; x=1735133302; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LhbI7QzymBM/wDdE86HmCxxmMCcz85iIDJAgr8RkU/8=;
 b=cpEaHyw3ijRIvWfSIxa6TxvRi7vawK0GoI5Aog4DoBf1ww0lqPOzmbKqjgbg5SpiHE
 ehPNEeodDnz+SLfod1yKXTGw/gACMY21rJcJXG3kYHyp9ncO2FTH5dVYADCU9Gvr6Sg6
 OPfqZxtDzje3YP8tkqRNoUV2Z0eNrpcbcWLN3inOWZAkWR7ExGASntocd6aG0qniwsC8
 bHjTYhU0nt+mYWmAIDOYdgBfebvKsJTIi848W8h7RJoAYgA+TPDZCURX2qi1yaHHZcEM
 c3Fd3kDegj9hNd1krBgSr1T6Ove3rQHcYbu++1IQuNPAaa1UBPDimSwhNXhqT/Bmtu2h
 zW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734528502; x=1735133302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LhbI7QzymBM/wDdE86HmCxxmMCcz85iIDJAgr8RkU/8=;
 b=gxcwLycWzQD/MovoSa5T4TlIKgH8ipF/GiOhcPzY20ZkIza7bUcpxbEXWw359lEMEv
 b+iLhM5qJPxTxO6UaVSGsEgr2G1frkcsv3f+16Xy92G47coc4lTwwLUxWLO7RJwpqYBs
 UEDha5eVeLYmTG4igai1Flr8d/VvVsIMFtMYqhM+4hl+EiE/+P6X0l9qzEJWe/dRE9X0
 lqGCTibkJE3c0e06/kqUEqrPwqJiHLoLMM5EwBm168WVA22mx3iCjLATnjZ4Nj8rXyfN
 VB/v4aMFTjUdAhb4XqzC8X5/qkBDnNOPsni5JXpoC7j6nxxA+oVDtNi8avS/wrdDzZhI
 8jlQ==
X-Gm-Message-State: AOJu0YzYt9JIXHud7IB9Yv0Elrf8SJsCJQZx4C9XDuECCHjXoASPMhuS
 CIEhwLiV82/GuO/zsoBGliyVswzwpRI6ZFIHyuUHKRweRjQEmihusPJVlwjSdjH/f8BtMNkyIY0
 H
X-Gm-Gg: ASbGncsm4K0EF/CEBnqskk+ikpQE7iD7+hYdQAtxdg0WAQj8/ZrP8D7MXoyeNltBH37
 2nRpC8kSoP6TqsAvQEIaDxGMrSEVTwJbDyv1yMvWiaw0A+io6+3wmBwhHe/MS6tfmZChRPjOBih
 UUNOL4yrP2vvR9Oe3zBXRedASrhkHsnA1ml/meyEEhfdITlYyyz+ZwfqAsyfWEdhMf4qE9AAKW6
 wxxWdkMu7P3BC59TWwVGTmLC+IZBGuCek3WwSoGES53cPoj5EnByoLm1oLGibuG8msRbJQA
X-Google-Smtp-Source: AGHT+IHmhMkNquyvYye6xsoKWLS9jZaAIFOscnVY3Rmu1gfXFHRaMBv4uaSt+aH6jHYGiGD8mVUgWQ==
X-Received: by 2002:a05:6000:4913:b0:385:ecdf:a30a with SMTP id
 ffacd0b85a97d-388e4d60130mr2818047f8f.33.1734528502364; 
 Wed, 18 Dec 2024 05:28:22 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80605casm14229082f8f.86.2024.12.18.05.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 05:28:21 -0800 (PST)
Message-ID: <0fbf4b4e-a0ea-43c2-a4c3-27e2ed8608f8@linaro.org>
Date: Wed, 18 Dec 2024 14:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] rust: pl011: always use reset() method on registers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20241212172209.533779-1-pbonzini@redhat.com>
 <20241212172209.533779-4-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241212172209.533779-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 18 Dec 2024 13:28:34 -0000

On 12/12/24 18:22, Paolo Bonzini wrote:
> For CR, the ugly-ish "0.into()" idiom is already hidden within the
> Default trait.  Do not repeat it.
> 
> For FR, standardize on reset() being equivalent to "*self = Self::default()"
> and let reset_fifo toggle only the bits that are related to FIFOs.  This
> commit also reproduces C commit 02b1f7f6192 ("hw/char/pl011: Split RX/TX
> path of pl011_reset_fifo()", 2024-09-13).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs | 23 ++++++++++++++++-------
>   rust/hw/char/pl011/src/lib.rs    | 13 +++++--------
>   2 files changed, 21 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


