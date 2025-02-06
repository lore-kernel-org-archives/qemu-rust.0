Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tg49o-0001Fu-VX
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 10:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg49m-0001Et-JJ
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 10:51:10 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg49k-0005fF-EU
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 10:51:10 -0500
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e58a7e02514so925267276.1
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738857066; x=1739461866; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
 b=VLa4q/JigSAPLjAtP6BBtS6K8fal+6B/n9MTeOK2V/o4RlNdfSANP0IzkTi9OZQajN
 96D4JfuxtlNxeZ+vDKE0h5Q1571M0G/WXPCFVk2yBlOXkDT7dsgB8LXP7keJHPfSqRSh
 9PURKvDKqz+3hS5OKy6jxOzQLRl73ac4CaS6sylrm/BwWKhflVxSiIDfPWKsRoMjtyCd
 NY6UkRScvi4D1sGBA2KI6Hi6rSjloyQAxJP5+UckjjVSGn1Fsnt6XWM+5Mb29Q38JNSs
 d/q5LOu/oA5/zWjn4L7WUsARe9q6HLgUD2BWJZro5/96aJZBRnzb7mJtGXAziEo+hnQG
 B80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857066; x=1739461866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
 b=j/rouVKzZjPdX42GVZzfF4F1TBBMksD81rr8Evp+BZ0DZf59znAasCKE1K8Zr2830G
 sxBku1oKYJDBFhmbmeTk/5gerAIo7jzL+t1q0bMQtdkRfwdIZb49XHcEdfN9IGfn7XZC
 GE+cBqm/0HkevHpDDeSWEW3f2kTWh6BJR/2TWPhXDRwZFZ2vmDkK4hsg0DaeuUjGsnH1
 LD3xBnzsy7GpOwYsp1EP7qzEyKdJEEUYVZs8FTVjQg8X0928L8vUteZRqIlwd+XE2rO1
 6ViS5KtZLsY/YN2aXIPx4R8H6hlMf/wcamSerodrxVjxPLIYXUOqOGFq8yGieiXl3l+X
 5aqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLtU70vPeMjXuOb6PNDeqAMMD0zZbvtNaVj3S+WnrQ+QRUQhoKSO5tit1WeoHiAtFqKh2FhQ3trOE=@nongnu.org
X-Gm-Message-State: AOJu0Yzl20iffvXq2qT4INe1nAhGWtb2eiTgkX7Mn0RtJTpYOp5un8XQ
 zxhdH2bkHOZ+zJDpwk5mIo1/kkTmzRhX1iQsPfoLdhIE3P0NDbw36J8T/Hxq8QWISsoXG4i+6CB
 HNR3QbHTMBoVSC0SfsqYn5zh4/B81f/5wXLBMHQ==
X-Gm-Gg: ASbGncubUluRKDIDIpzXpqkjon7Rh3muCBTwHtaJJcUs+cvg5vqgTulkGj78bcBY9wl
 YfRfrU+Zzx3l7AmCaV8Lg1l1gkFMbU+nqfJ5ipDS3+Za4zyoBqU4w36Ydwq1RAgQef8oxob2mwQ
 ==
X-Google-Smtp-Source: AGHT+IEVply1qiNn7znAT8fQMFvgeU86wRbWjC73n9GgoJ6MafGCxRH+1m00cw4BFE1qriSGZOIZY/VTW8vN2rZ7ZSM=
X-Received: by 2002:a05:6902:2210:b0:e5b:1746:7fa3 with SMTP id
 3f1490d57ef6-e5b25bc6f9amr5963299276.23.1738857066557; Thu, 06 Feb 2025
 07:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
 <20250203144048.2131117-5-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:50:55 +0000
X-Gm-Features: AWEUYZmb9iLML0ZpPW3OB0h1I8Pz0Rcl4bMdig2uKDsyMoFyCdpxYC5JLddP9OM
Message-ID: <CAFEAcA-SRrdyeBExuCruVd-CuDdosyQKG98stELvkV-EM9q-Tw@mail.gmail.com>
Subject: Re: [PATCH 04/18] tests/qtest: simplify qtest_process_inbuf
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, 
 qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Thu, 06 Feb 2025 15:51:10 -0000

On Mon, 3 Feb 2025 at 14:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Don't both creating a GString to temporarily hold our qtest command.
> Instead do a simpler g_strndup and use autofree to clean up
> afterwards.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

