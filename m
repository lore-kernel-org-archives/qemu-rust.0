Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tABL3-0008Et-Lo
	for mharc-qemu-rust@gnu.org; Sun, 10 Nov 2024 12:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tABL0-0008A7-JX
 for qemu-rust@nongnu.org; Sun, 10 Nov 2024 12:02:59 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tABKy-0005vF-MX
 for qemu-rust@nongnu.org; Sun, 10 Nov 2024 12:02:58 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso633049266b.3
 for <qemu-rust@nongnu.org>; Sun, 10 Nov 2024 09:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731258174; x=1731862974; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MrlmipU7gDyelYiqq1Vx8MZ5Sox84+3e6R+53VbFjlI=;
 b=rbtmBKuHD4SZFpWudzhne50XSvfvsB8UxhhNQ9rLbiE9RoFpJCttxtA/UX9KGyu4vy
 yKYxS7YLubq6OPFCJYk9tZv5L0A3TDP+jiSPMhSeuLdz6BOJRGueTg7Wj7+kyIx7DQwt
 TH+wO2pCRfGshxoM/uTqTRSVTKVle21uBg8kN5PyiaPuroYpvDPtZjvSnViEG4DwtqJg
 pWAXI5qzwwSReU0b+ffXSL7wtD3eMBr7nH/0wI5FkUWam3Ru+uysVlkp662kr4XbUcbl
 0cq9BeHRrjAN99+u9oJJSjqlnM8Wa4ZNMsUnsymUSDFBPtE/dWiyAUuAGvCMXNvbIlau
 Rb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731258174; x=1731862974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MrlmipU7gDyelYiqq1Vx8MZ5Sox84+3e6R+53VbFjlI=;
 b=vMqKN5PcROFaOn00mz4tCyiDSQIiz5ihIVsdIP5WuB54nDbEFzjSPJfEM6iyt+l8YS
 sNczR33Gbm6bCuQQ/m4bU+VMkkwsXT5yCUkGbl1IyHDgOxlDcUyrEtpvsT2Pqsz4iMmk
 pVbRQlubHtlr9dbmXxKqiG/4CEz2DABdI9wGZySatU99akT9NB2+xJuePV3AG0D8JhQJ
 a7I3/3bVgvGzmg2RBOADtq6fNkH/T/Kyt4/WZ9Ivz62BPQcN1MoIYJ9+5A+bfQLryZhv
 DesBhlr4916FC4xmNUT+GNsooEIVFFT9Vk6MCcZBlDFJ6zR9kGrmcLIdZqJN/5MILt2O
 bLBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWFd0UbXoGU7Ynuz8UnNw5kYt6bpC4e/tTmc0oMFwYQJKlYH2lqACw0boQqTF3hix4388mjOVJ1C0=@nongnu.org
X-Gm-Message-State: AOJu0YzSRIUWSAbtAugnFYt7ljkH/wReHFJStrgTCUeXERgS+lAiw93L
 thUHYSFlmHY69F1a57gANjnNwhh8EferxhBBN9N/Tvl1DfaHLjq5r90VHaelUij+2pUZxiK6/la
 dTNRd8QQMH6G6e0D0LVyG66crBFkTHxTOrRXvLw==
X-Google-Smtp-Source: AGHT+IGp05PADq+YsBKNcizpiAzuA1UCJY96cNjyFFJSNhXrDqW6S0+ovssVbVnGQkrVYo76zJwjAgppBQAdumXc/UI=
X-Received: by 2002:a17:906:f598:b0:a9a:4a1f:c97d with SMTP id
 a640c23a62f3a-a9eefeaf039mr963214166b.7.1731258173857; Sun, 10 Nov 2024
 09:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20241109-update-maintainers-file-rust-v1-1-f4daba6f782f@linaro.org>
 <aa360d5f-b4f2-4a61-a5b8-decc87a97a7b@linaro.org>
 <CAAjaMXayR_Ugkz76OuYe97tEKvHuuJA79f71GJA=zt8L=ESb2Q@mail.gmail.com>
 <3e3075c0-7555-4732-9f2b-4c0ad9b064fc@linaro.org>
In-Reply-To: <3e3075c0-7555-4732-9f2b-4c0ad9b064fc@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Sun, 10 Nov 2024 19:02:28 +0200
Message-ID: <CAAjaMXbShaEDXXpXiSOxwSxahyTudJ-hYT4QwctyOLD7DqvDxQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: CC rust/ patches to qemu-rust list
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Sun, 10 Nov 2024 17:02:59 -0000

On Sun, Nov 10, 2024 at 5:36=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 10/11/24 15:19, Manos Pitsidianakis wrote:
> > On Sun, Nov 10, 2024 at 3:59=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> >>
> >> On 9/11/24 19:29, Manos Pitsidianakis wrote:
> >>> As of CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix45Yw6gVHXozRQ@mail.gmail.=
com
> >>
> >> "As of [*] ..." but I'm not sure about the usefulness of "like
> >> qemu-block, qemu-arm, qemu-ppc etc but", maybe scratch it?
> >
> > I definitely find it useful, for what it's worth. It's an all
> > all-encompassing topic, like block or arm, and some people are
> > interested in keeping an eye on those topics if they are not CCed on
> > the main list.
>
> What I meant is to reword as:
>
>    "As of Nov 2024 [*], we have a new topical mailing list for Rust
>     related patches. Add a new MAINTAINERS entry [...]"
>

Ah I see! I only wrote it to show there's precedent for that. I'm fine
either way, if the maintainer wants to alter the wording they can keep
my S-o-b.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

