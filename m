Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A42CCD1AB
	for <qemu-rust@archiver.kernel.org>; Wed, 22 Oct 2025 12:51:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vBYJO-0006yl-8p; Wed, 22 Oct 2025 08:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vBYJM-0006xd-Fg
 for qemu-rust@nongnu.org; Wed, 22 Oct 2025 08:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vBYJK-0002J6-Ia
 for qemu-rust@nongnu.org; Wed, 22 Oct 2025 08:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761137481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=hcJwsR0m5Z1C3YNultQM4/m0gYuKZXSHgmkYiDgbRBdFllDonPZX+npKOwfsJQLytP5sEK
 1xzhzz8xNTawA49v+zpzMWMliUaD48uCTFh3t4xl2g1rchHfn7M38wdamxQdo7S3w+AKFl
 CHKaJhFKJJuphlSkJKK4+cnB0RUwgzA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-R3PNEJsvPeGiXUuz5YMCCw-1; Wed, 22 Oct 2025 08:50:00 -0400
X-MC-Unique: R3PNEJsvPeGiXUuz5YMCCw-1
X-Mimecast-MFC-AGG-ID: R3PNEJsvPeGiXUuz5YMCCw_1761137399
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47113538d8cso38474475e9.1
 for <qemu-rust@nongnu.org>; Wed, 22 Oct 2025 05:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761137399; x=1761742199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=UVv3g/tgHU67hz0Dkd3TcZT4jFeop2Qnon2lAKWX8J0HeDkSPvroHdJZl62Fm/tdUh
 PULX+T4WWRaZYHP8ehsHPqUePWMCbCb3JOcgBXmhz7RVYqtsNC/Rq1dT+xlc+UpU+SFc
 eKG3MJops7/CTSWZXoJU76mic58SUFlCx/k174YA5QAMaK4rXX7PqK4lfgCJu3iK+oqx
 l9rXE9V61QLX24xTvvBBeaddhzDHgMy2oaAAIf3cWO32AhXdefq1IzDL26AZz0HBQqpJ
 8XkgEEwEOvGdYLPLdHsb58oYi4I3ipVaFiYBsOjrZF9mA4ae0DN2Zrrc97h0AxF+LDWD
 6OSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHw5+BixzZn/sNBvMeRUd5x0W35OY+xEoRakQ+Fo/dymzrkBteXrBZXYniWBntRtIGIzOXIPDHcnE=@nongnu.org
X-Gm-Message-State: AOJu0YxGMXd8wh8JHWEGMDMVQQXmc+mGCpQgAR83mu1cJgqXDA+VZ8v3
 BGSV6SBgz6XJuNTae4CC5PJIwZvkNN3zBKYJFIsrsNnZm/BBmi1pPPu6wEd5IZddaEGPOnCW8G6
 X5Nch8oIUH8iByIewTe0wJIsukhfUIHLJmu7WQiQZInXmCT/hr+y0W0k=
X-Gm-Gg: ASbGnctI3x2D20mFSAwJ5/zr+NIMjIeZkEcGq2EQkFUVCOEchjmTyCeAp42GHScpmF4
 +CUAvdrrIeag2PBZHSC6XVFFUspotdND/DIBDFrmrsP1vBlYTd5XASyfDsVSjLOrVIrQURgpXkh
 8QcPq5/f/euRzHsjxdwohMb+/EGfkQDBso+zwnvNo0IJcC/3r6wBvf8umdVaZNm5znXZ55w0ISC
 11xSkBce6aiNl/gs74bxhlMf1ftPH09DEr5MeB9VKC55aYtIiaaPK95vGtJ9DyibgLUXmZCiPz3
 wgU+k8pJ9aJF9Go0iVBwwIGwUZ2PGfFBSwGGyd9KDeGVkEfDwmNwAivIIIwc/LgVVS+Nvx6ZuRJ
 RcofO+rWsgard37ZSW0aGmT5GR6SNH9R1vwFeBWTxqTn6SkDJZHSDwjlsoDqzFB7dyZQMQVLo6E
 hykQ==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id
 5b1f17b1804b1-4711787350dmr122416995e9.1.1761137399210; 
 Wed, 22 Oct 2025 05:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Hm2BY761ErfCQAW9TWE1D63G3DyFVH54t8V55V0H1jT6mBT86okovR2Of93UGrtI6FGtKQ==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id
 5b1f17b1804b1-4711787350dmr122416435e9.1.1761137398787; 
 Wed, 22 Oct 2025 05:49:58 -0700 (PDT)
Received: from [192.168.10.48] ([151.61.22.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428a534sm50029055e9.6.2025.10.22.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:49:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L . Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Corey Minyard <minyard@acm.org>,
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Raphael Norwitz <raphael@enfabrica.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer : vhost-user-scmi" <mzamazal@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list : Sharp SL-5500 Co . . ." <qemu-arm@nongnu.org>,
 "open list : S390 SCLP-backed . . ." <qemu-s390x@nongnu.org>,
 "open list : sPAPR pseries" <qemu-ppc@nongnu.org>,
 "open list : X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list : RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list : virtiofs" <virtio-fs@lists.linux.dev>,
 "open list : Rust-related patc . . ." <qemu-rust@nongnu.org>
Subject: Re: [PATCH v2] char: rename CharBackend->CharFrontend
Date: Wed, 22 Oct 2025 14:49:51 +0200
Message-ID: <20251022124952.3691010-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V7-hpmWUQnGxpa-rkHjGBu6i2YwmGa3Na7ZiLpHJi2g_1761137399
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Queued, thanks.

Paolo


