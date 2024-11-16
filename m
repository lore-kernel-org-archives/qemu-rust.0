Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tCQEc-0007Dl-7N
	for mharc-qemu-rust@gnu.org; Sat, 16 Nov 2024 16:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCQEb-0007Dc-1P
 for qemu-rust@nongnu.org; Sat, 16 Nov 2024 16:21:37 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCQEV-0002PA-UL
 for qemu-rust@nongnu.org; Sat, 16 Nov 2024 16:21:34 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so859476a12.2
 for <qemu-rust@nongnu.org>; Sat, 16 Nov 2024 13:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731792090; x=1732396890; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R0svVznsXJi+KwTmDjSl06FehgpkSPdLwSrxOHWybLM=;
 b=ddhl/sgWGkLFhXUUZWao7aOh0UrUa4QDp6khKH5cBGYJmbFOimTvbWBcG4p3lwvQGz
 PjRrR2v+r+6vsr+8gbXmUfx6BVaMePeUlTdMrIThou9qYT1s88/7YvGvmAAuHyDxAKLw
 NwAg9cI7VKmRtLACG1P3/viiWWXZ7djzvvF8HPyitDHMKi6wriuikGidbn+mxNeqaSbo
 QOVzHoEleUK+gicDTAqVeanQsxSI7Zn70ksZkx5OPgmVmscAV+YPiOZO58y4kEllip42
 trmL3ha50310lJiZLlVVCz7O8Nqg5ntqr7WWXlTwSQQSp3Kv5Lamn7+qfvPVFBfdINoG
 KP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731792090; x=1732396890;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0svVznsXJi+KwTmDjSl06FehgpkSPdLwSrxOHWybLM=;
 b=QhuO10rXYPLiPetyZGE9TB97QeT9KxSTa8a+2LaC1mMWx971dAS0Odq38qR6UQN/3h
 HUzl8qPxcS5qq2IvtvOfIbEj1zbirotKxho5NeOmXP3u2iGVyPvzzZgYKBloIppWqFtY
 +vAqraL8uKGTk+0wU3LITXBTsl+V5d2UVFakNfzQ4emiztBrzRmopm08psCOVV+just7
 JAVme5TKKXAhcUj/KTup6RGMiyKq7vufs+UbYIYVVD8je+Kxn/itcwMYTcR7DBi44z9o
 JhIMQtSxvNc17HLqTOP9iokvu7zgUOlP8IJAT6dtkUuL+xitz0L2q/8wrH16dfagx/Hj
 igkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnWUknLHNiF/1WtzhgHC1bdwF5NIsOX1JdV11n1v4dXcFEfQ9cINJkYElvubZV1JJiFCvTIkpjTtg=@nongnu.org
X-Gm-Message-State: AOJu0YyG23RWU+aqD2yx7IuohfKB5GDrgfHft18eMNPsCqFwvO8e8IDS
 5vlaA1S14l3sQM7gfWEPmP5VlaqEBiS0RxDJoV+IXu1pohkvqWXde0A3lRMF0VsHwkf9WsqkfJY
 YOjpYkOth8tTgaSO78s81lAS5RDjO/M1FiTsqpg==
X-Google-Smtp-Source: AGHT+IHJpXXN+h/fZR58qw/EGaCnjiUJ5snTWk23QeGNj3pNEAMKzeSTL1Th/bkzBI2S+21D1SNAjst+hriuI+OF5yM=
X-Received: by 2002:a05:6402:2793:b0:5cf:95d4:7b89 with SMTP id
 4fb4d7f45d1cf-5cf95d47d98mr4580665a12.8.1731792090102; Sat, 16 Nov 2024
 13:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20241116181549.3430225-1-manos.pitsidianakis@linaro.org>
 <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
In-Reply-To: <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Nov 2024 21:21:19 +0000
Message-ID: <CAFEAcA9n0+NE=hf4F7PDp9K7bwn96msdPYXpBPaY0h5-9=7+8g@mail.gmail.com>
Subject: Re: [PATCH v1] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Sat, 16 Nov 2024 21:21:37 -0000

On Sat, 16 Nov 2024 at 20:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/16/24 19:15, Manos Pitsidianakis wrote:
> >           match RegisterOffset::try_from(offset) {
> > +            Ok(PeriphID0) | Ok(PeriphID1) | Ok(PeriphID2) | Ok(PeriphID3) | Ok(PCellID0)
> > +            | Ok(PCellID1) | Ok(PCellID2) | Ok(PCellID3) => {
> > +                // Ignore writes to read-only registers.
> > +            }
>
> This is indeed an improvement over the patches that Junjie and I had
> sent, because the writes would have gone down the eprintln! path.

In our C implementations of devices we usually let writes
to read-only registers end up in the same default case
as writes to invalid offsets, because they're all
guest errors that we'd like to log. That's what the C pl011
model does.

-- PMM

