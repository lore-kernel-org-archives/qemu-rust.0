Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJZXm-0004kY-NX
	for mharc-qemu-rust@gnu.org; Fri, 06 Dec 2024 09:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZXl-0004kI-EK
 for qemu-rust@nongnu.org; Fri, 06 Dec 2024 09:42:57 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZXj-0005r7-Q6
 for qemu-rust@nongnu.org; Fri, 06 Dec 2024 09:42:57 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso1206979a12.2
 for <qemu-rust@nongnu.org>; Fri, 06 Dec 2024 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733496174; x=1734100974; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zNNjniwqUhMlBfoCOuzJRb4aiH2/raOgGs4PxJ7xGnY=;
 b=xz0KwP4cluQ4FTeOZ+WteCM+/AAfwFJpncCbubqYgBOqZRsedGhvuh7av1wLmy4PYH
 x930P8bfGzuar9RPLagsoaLk+A2Wqu9ryNCj3be490CyvD1xCOTV9GF3Ub55SMU6caGx
 XLlZPr1X7XKmgm3I5/VdebFh1JGuTqthaZiBI1NOs/ll7w6STdW7rR+8nNtAQltXtUB0
 bANaFmCEyW28CbItue1jLb3l/aV+bvOLaxascVwdAJ94HMKmKpv5dnw7q1wLbsuHauen
 igXySKxrOBk4vI8ecrJZMNU7rCHVcTbNA3vEup5erScz8o//cEGPjolRvLHhfWinsC1I
 UkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733496174; x=1734100974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNNjniwqUhMlBfoCOuzJRb4aiH2/raOgGs4PxJ7xGnY=;
 b=SlciEbKozPx3sCOHI5AnoIxtdLcTzV4bZI6f9kIx9n8xH7m8IEBnmWcoODX1pGeVLw
 RFiCrvfxsGLGbbpyYBcpIwOwDBaj0oUiUBfBozIJHYrWtX4XSBZPrme7rSA7TH6vOie6
 EkU/lRAbLQOchli3cE29wrSZipvKyudNkyNgAHUKiBub6slpeqEUB5rq4F4Bdr+Fh1fZ
 PBJCXepiFUUr/5UC+RytRVprrtxtbs4Libnp5sHCf/v2hrl2J3/rW305UWLUq0th4PC0
 fxcmlvMLAJVNm2+loya3BEFf1y4z0cRkGjCvg6z3VPSXp6LFD/L1uC9Wouc8Te8itewN
 DZxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeWDXy664El2QPhVV7criouaJ1LBFjndw5KASIrTon++A78VCG1WmUTPLOZwQK8MsD0FM1XMM9MPY=@nongnu.org
X-Gm-Message-State: AOJu0YwGtyeM8vUt9Oy21q84A0aN/RMJTG4uzm6G0HxrJEk4s1jAEZIy
 1PGDSdk4+5g+UO5MunEAt0Ep5Z6eaHKAcBYWp97CDFkLh3hUFalIn0Ov8uZcxuTEqiOcdHiPM4k
 VASzuynx2C71yHAYSJroiEwjm3UO1jPCmbL53Sg==
X-Gm-Gg: ASbGncslJwHuigrqhF0uX7d6upCTILBt2cYD3g4/qTlkfUdpwXHjF9o7L23LoAn87kY
 KA1mSMSg/X8z6ws+vN+in1HEsqcaagJvH
X-Google-Smtp-Source: AGHT+IG+4QjcRBK/DasgfnyR9UQQiv1EsnNQR1FmEULqMJInJmDgYpCFJgEJdG6WWAuCRqvny0P3ZtVzXUv2UCN2YR0=
X-Received: by 2002:a05:6402:254e:b0:5d0:d30b:d53e with SMTP id
 4fb4d7f45d1cf-5d3be697749mr2745482a12.19.1733496174107; Fri, 06 Dec 2024
 06:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
 <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
 <CABgObfZSR2s5AYEAcJfsdF0jKQGf_AVcDafKQq47qzLmBuX0RQ@mail.gmail.com>
In-Reply-To: <CABgObfZSR2s5AYEAcJfsdF0jKQGf_AVcDafKQq47qzLmBuX0RQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 14:42:43 +0000
Message-ID: <CAFEAcA_dVnpN2Vn+VAf1XZSAdj183wJhQZ3pVNtb=NHeMOF2Jg@mail.gmail.com>
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Junjie Mao <junjie.mao@hotmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 06 Dec 2024 14:42:57 -0000

On Fri, 6 Dec 2024 at 14:28, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
>
> Il ven 6 dic 2024, 05:59 Peter Maydell <peter.maydell@linaro.org> ha scritto:
>>
>> > is still decently packed and simplifies things a lot.
>>
>> The old struct is 4 bytes, and the new one is 8 bytes.
>
>
> Yes, hence "decently" packed. But I think in both cases it's passed in registers, and for 64-bit machine that shouldn't change anything.

True. Though it does mean we go from "space to add new fields
without making it overflow from one register to two" to
"completely full and no space for expanding it".

-- PMM

