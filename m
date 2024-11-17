Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tChTa-000624-1A
	for mharc-qemu-rust@gnu.org; Sun, 17 Nov 2024 10:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tChTX-00061O-40
 for qemu-rust@nongnu.org; Sun, 17 Nov 2024 10:46:11 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tChTT-0005uD-0D
 for qemu-rust@nongnu.org; Sun, 17 Nov 2024 10:46:10 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso450106366b.2
 for <qemu-rust@nongnu.org>; Sun, 17 Nov 2024 07:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731858365; x=1732463165; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qt/fMxc6dzaFHqdOGIprWloj5gANdSerbQx5+PbZzHo=;
 b=NG5FISspK3tCKCj48jqcmS7kmug8gjXFygIbkVg5M6ff55txTfNLYq6PKTeHRNzL6x
 JV86fAXpj7DF1LmAdXV0JHNV+ry7p0F8ax0pDF+6Vrf7hk1n9Yh1n+VhXCsSn8J882cX
 LgSwEg0h5S/acDgvDqJjv9fLEk5v2EJJbSpmz0DTz1HZlxbReHP8cpT4kxkbLpxSAspL
 XI9QRwDMuBHpkC00fFcwgTb4Y1zRKuB4SqLF5IcNXUGcHcPe2xF47eB//GKTJMPe4ka5
 Q6hR3SbtWqvpR8AMheN52SHiV2eDQldPfRyZP6onESkUuQnXSo16cBiWIk7bE5CtgrIp
 qBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731858365; x=1732463165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qt/fMxc6dzaFHqdOGIprWloj5gANdSerbQx5+PbZzHo=;
 b=iPTph5/F48Y1HxXdv3j69N8rfg5LDpokHDqOwaDU9mwl3zj3V66LiIaf5C8A6v8Ssi
 /6fF3sFW7pzktAmflncE8tph0EAzIbwZmKwXcPIVOId/lVvEQmCiZEsO5FCz0Fpcgh1h
 hSAf+6DAF+9Cz2PAo0d3sJqVGMoxGA2PQ0IUKxhqAQs7uJOgzMcbL+OI/EY+pkkquliO
 1Md/9JGn9KlDKIEDD9lcMfrI3xDHrNMHTKRH6W3SFcnq2qn+zblDkYBt+Jfi7Z8i4/XM
 C88sMV2DsHciZrDt0CAhCQAEXnJgp9WyWGtn6uA8bW1jb9m5ZSDtIGt3F6DcQZugIe4I
 Nq8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5yYbMpbKsPsr7KAv743qJh72JVNp6a183t1vHuP6MNOIdoyL1s7+1sZXzSYe6i1UXzsdOZk4UBbA=@nongnu.org
X-Gm-Message-State: AOJu0Yymfyhv3LXEVxpoOf1GzBc6pmjFT3xs4xTJXaEItdsw3m8Woj4+
 WVxELTNIEDt013lc4AFFH6W/T/EpQX17VHwipm5soJ7RW1H6LEt9Fnb7d+Yj7INw8ax31D7F5hx
 4bmbbvHqYr016R2ufAxK0Aqsun3JhkieUE0EHaA==
X-Google-Smtp-Source: AGHT+IE7UgFA1Lg9VieAvw9s0U+CVancl2jMf6S+VYWksBOKQIFdFI3OtC+3WKyAe0+BpsY5dkVzUJmYp2EC945omZM=
X-Received: by 2002:a17:907:608a:b0:a9e:c947:8c5e with SMTP id
 a640c23a62f3a-aa483552958mr901831466b.57.1731858364956; Sun, 17 Nov 2024
 07:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
 <CAFEAcA9m7EnMX+=T0TL2R_NCJqaPUPCUcoYzAo4P2oRUZbM6Kg@mail.gmail.com>
 <CAAjaMXZE+KKJnvcMpmpaH+dmO7MQVmJm7pD+i1yo_5Wb9-ERcQ@mail.gmail.com>
 <CABgObfadfaohQNf5AheVAUSL5G8i9+zeTOwXRPhOwC_6NpTvmQ@mail.gmail.com>
In-Reply-To: <CABgObfadfaohQNf5AheVAUSL5G8i9+zeTOwXRPhOwC_6NpTvmQ@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Sun, 17 Nov 2024 17:45:39 +0200
Message-ID: <CAAjaMXZboQ-4yxtUVtTWsweT0QXfS4FT5JgLMMr-2XjZ9uBWvw@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "open list:ARM SMMU <qemu-arm@nongnu.org>, " <qemu-devel@nongnu.org>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x629.google.com
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
X-List-Received-Date: Sun, 17 Nov 2024 15:46:12 -0000

On Sun, Nov 17, 2024 at 1:16=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
>
>
> Il dom 17 nov 2024, 11:21 Manos Pitsidianakis <manos.pitsidianakis@linaro=
.org> ha scritto:
>>>
>>> This seems extremely verbose and rather obscures the fact that these
>>> registers are a set of adjacent simple ID registers, compared to
>>> the previous code which defined them as an array of values.
>>
>>
>> One could abstract them with declarative macros to reduce the line count=
. WDYT about that approach?
>
>
> No, this is just overcomplicating things. Like Peter said, just use array=
s. Copying from the V1 review for reference:
>
>      const UART_PCELL_ID: [u8; 4] =3D [0x0d, 0xf0, 0x05, 0xb1];
>      const ARM_UART_PERIPH_ID: [u8; 4] =3D [0x11, 0x10, 0x14, 0x00];
>      const LUMINARY_UART_PERIPH_ID: [u8; 4] =3D [0x11, 0x00, 0x18, 0x01];
>
>      /// Value of `UARTPeriphID0` through `UARTPeriphID3` registers
>      const fn uart_periph_id(&self, idx: usize) -> u8 {
>          match self {
>              Self::Arm =3D> ARM_UART_PERIPH_ID,
>              Self::Luminary =3D> LUMINARY_UART_PERIPH_ID,
>          }[idx]
>      }
>
>      /// Value of `UARTPCellID0` through `UARTPCellID3` registers
>      const fn uart_pcell_id(idx: usize) -> u8 {
>          Self::UART_PCELL_ID[idx]
>      }
>
> Paolo


Nope, it's not overcomplicating things. `idx` is usize where we have
just 4 registers.

I will submit a new version

