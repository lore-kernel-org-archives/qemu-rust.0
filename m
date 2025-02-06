Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tg4BT-0002Bo-Dn
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 10:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4BO-00027j-Oa
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 10:52:51 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg4BJ-0006td-DW
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 10:52:48 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e589c258663so1113105276.1
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 07:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738857159; x=1739461959; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
 b=saz22xorWG+9KIYeHMBgHo+3beIDjPP3O1N7z1r8RJcSOqk/1TSa5AdExeFgecMAW2
 SetwIrPXO5PelPFktjJHrhMMxyjos9ktReL5zwz3NYhat5nOKbmFQlGiJ+jm8wrbYJ8P
 cWI6zGSMQwfh5jpoqp2TxWoNdSOXMq8s3rvkj7XTXiEukuqm/rhPZP2HZWnV/bkGyr29
 f3M+nTl3lyTsltjLdvRPOv1/Ro6N1PrgSX7tpgr2ulmRrBVuGYblDZqZ9azb0XvdUQnr
 m2LDaT0gEkEzVsOAjrT9KWLb7jV3sxJ+oJEp8u7XNEXkCvNPp+sDCm3LBYXcx+cT1cX8
 ok7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857159; x=1739461959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qK0YsYi5T0TrmWuzPT6kLfisgyFRI4UVYy2zpuffB5k=;
 b=XH/Xo6ttTl0m48hkbAuT1qjA2rW/2Z7wO48m+6unA5YMs9POh5ih8KOXZlgOirfK+P
 HjUQ6A2FZFSH9+udfAWDKdfnXZFqlNHjkBtnX6oSbIqxX20uSdGKizk89qZM5Jrfk3Cz
 LGyPePadEbSIWNEefRlaOTcR785xkprnChd1qqQJ+qlU9eeiK5Uwkf5OElTMYFqFGnRC
 Mp0vEiX3pugEo5eHXpNykR5KsV/S9dcPPC0h+U0ABtKsqIv3sJbtyuCApPFQiN4EeDQY
 0dfsR3FXAMpHvcTIBd1jYW35SEBmeiOkuFnuNNfysWfEzqvMUc6OF6snEE0IjfYqd/IN
 24ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyFOZiRWqqmOnEvPEWbU2IU6h3egHz1dXw4viP0nzOA9cfmAwFBuk6FbhzfPw3HYyRQ1tdQY1gFSU=@nongnu.org
X-Gm-Message-State: AOJu0YzeJMZ6qQ2q9uBhWMzDO4IP3kQrNwaog5ga0LHkWWQ7xNMVyts+
 LTqMsm1xoPsw+T7EAQhwef/mZ2T8Ev2LMGtjQAD7GwoIprWNijh69xj9sOSpCAkNYxuRidEuPfx
 Ppo9PCw+UAHxoloBi12BfS3lAbE21PZAPxNpc7w==
X-Gm-Gg: ASbGncvZpiA0rHJinrwNAloPbEB+ML7ynsNJ59WcXI1ElhmO4174asOiNoiTjkIwI5u
 Lht3epntQNz7mGvBzFA/m4rrdm5A/VlAQkE0tAR4wxMJB8dm9yaToi5T4z2d7NVTHiLIzq/gtXQ
 ==
X-Google-Smtp-Source: AGHT+IGINeWTSKbjmfoPs4JgPVdgMOggbKB4BYTLBGiV0ephLv9sPQFpHMENgqCDe7gKGTrcm7ROiGqMd8iBtYFmdt4=
X-Received: by 2002:a05:6902:1087:b0:e54:ab05:4505 with SMTP id
 3f1490d57ef6-e5b25c0957bmr6324767276.44.1738857159185; Thu, 06 Feb 2025
 07:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
 <20250203144048.2131117-7-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:52:27 +0000
X-Gm-Features: AWEUYZnAPSByxpRAMEhM1UO803j7aoDYdB1KX7S44_DfsCu2bJkbx0AXWGbu_is
Message-ID: <CAFEAcA8ZcYtD44h1VupTR+Ka30D+HY6H+n-DnTW9muhy7_u6NQ@mail.gmail.com>
Subject: Re: [PATCH 06/18] tests/qtest: tighten up the checks on clock_step
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Thu, 06 Feb 2025 15:52:52 -0000

On Mon, 3 Feb 2025 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> It is invalid to call clock_step with an implied time to step forward
> as if no timers are running we won't be able to advance.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

