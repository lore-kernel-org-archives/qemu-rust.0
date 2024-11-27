Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tGH3y-0002Nb-6E
	for mharc-qemu-rust@gnu.org; Wed, 27 Nov 2024 07:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tGH3w-0002NO-VF
 for qemu-rust@nongnu.org; Wed, 27 Nov 2024 07:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tGH3v-0002yB-7e
 for qemu-rust@nongnu.org; Wed, 27 Nov 2024 07:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732710148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4O6nW471G/UGmDhGC9d7nOGe3smH47tI63C5ANkA20=;
 b=J6F/GAQ2s0lV3FBrhMij4opBPuHabPjwpSDVDbGLl6q0mrGK0YKnJLhUuIqwNIYhkRCHMQ
 geQGLPWOcTAQMfDcIz0FrBV26q4w3fsB9nvFaeGm6bebUTqBwg/pl0pGYVPoUjV2HtjUk7
 jWi3d1fkn5wzvKWDYYn6sKRfbY/UOY0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-VPxWIws3N-GKKsJcC7AQvQ-1; Wed, 27 Nov 2024 07:22:26 -0500
X-MC-Unique: VPxWIws3N-GKKsJcC7AQvQ-1
X-Mimecast-MFC-AGG-ID: VPxWIws3N-GKKsJcC7AQvQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38256bf4828so430790f8f.1
 for <qemu-rust@nongnu.org>; Wed, 27 Nov 2024 04:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732710144; x=1733314944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4O6nW471G/UGmDhGC9d7nOGe3smH47tI63C5ANkA20=;
 b=OrTD3VzD/ZvmMzCytuXGKGvfM78m2imgB1wdNY3zDWbl8+1NzJMTFCeunnXyELKp2K
 UIUrPDxkR2yY7vJARTwm1ah67ySbe24HxRHX7jm072n6rvH3gJ+dkXYGD0wj1Dn7P72f
 wa+M3PET6ZaU0tryWQ+NlwgicI5rwV1tgNGOfSwU0Uvv2ZBbSHt+z2wXJOD3QWVxuASg
 DMEEPxHGse/U0KZEz0mD7/GSvASbXboToaAnNnqkwD4a1QWiMF90ap8S7828012mzO2W
 AMDCkfKCPGL5jAYUzqSyHKCVElAya2H993tdj+4btA5ManksC6DQI9bZ/RcSKd0bOnOW
 DFxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYCyVAwJO+xepchSVmM1thETP0xV/GFpl4BaBcUzooHubIGPq5KNAIUo+5+h4g0Saj1cT4Iv55g5I=@nongnu.org
X-Gm-Message-State: AOJu0YykLUSwZ9OJ1KD7t/KQyfdKJUBWrWwQnLQaOcONEyp7ApYchExQ
 H+dDjA8etO25JQjtKA75jk/8d76dLHxO8g+UqKOsLK0Y8DVyoJ6f+pcFmgexH6CRot/6e4BHdZ2
 VeUXYcsvtJaSyvUQJMN6EwCALZy1QlbIsq/ksP8kWM2zDUW8yUkap4aqCkHnkvHYrqp6i+RKc2G
 mWaMMBVoCw101hORAaaYcyKqjsiOp/kPD4aw==
X-Gm-Gg: ASbGncvVX585I6eGTzJYTv8GgV+7qXIIbgCbAw2Ywg3otoa2s42leh+kr22hnPfv2mJ
 E9yaDZrFL+UU45wcJkGiYFg3vnd/N3wVO
X-Received: by 2002:a05:6000:4020:b0:382:3c7b:9bd with SMTP id
 ffacd0b85a97d-385c6848da5mr1987032f8f.30.1732710144074; 
 Wed, 27 Nov 2024 04:22:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH7i/aixZ2h6p9/ETM0G64AKoUp3Ew2h8XZt+ILrrXyM60PBStkTVnfRqANJFicd611ZNTG1Xt6Q0W52jGI+k=
X-Received: by 2002:a05:6000:4020:b0:382:3c7b:9bd with SMTP id
 ffacd0b85a97d-385c6848da5mr1987016f8f.30.1732710143736; Wed, 27 Nov 2024
 04:22:23 -0800 (PST)
MIME-Version: 1.0
References: <cc40943e-dec1-4890-a1d9-579350ce296f@pbonzini.local>
 <CAJSP0QVGP9RQ57V-+2Lo2Se0x0O1KuENT24HzOn2X3A3vmn73A@mail.gmail.com>
 <Z0cOKGl-46wg5NTG@redhat.com>
In-Reply-To: <Z0cOKGl-46wg5NTG@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 13:22:00 +0100
Message-ID: <CABgObfaZkCQMWH9oH5rLdqHB-B8t2n9uWSaYASsBzxiiMK1hRQ@mail.gmail.com>
Subject: Re: Rust in QEMU roadmap
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: udxImzeA-SZzSHHnJEhFitqJgVyX1YOtZKkho9YayRg_1732710145
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 27 Nov 2024 12:22:33 -0000

On Wed, Nov 27, 2024 at 1:18=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> I question the usefulness of the 'syslog' trace target. I can't see
> it being desirable as a option for 'production' builds, and it seems
> uneccessarily indirect for developers. What's its compelling USP ?
>
> WRT 'ftrace', IIUC, the Linux 'perf' command has built-in support
> for using USDT probes now:
>
>   https://www.brendangregg.com/perf.html#StaticUserTracing

I also wonder if 'ftrace' is duplicating 'log' these days. Anyhow, if
we can deprecate 'syslog' and 'ftrace' that would be good to know
independent of Rust.

Paolo

> WRT 'ust', in LTTng, I see reference to the ability to use USDT probes,
> so I wonder if we still need a dedicated 'ust' backend around ?
>
> Potentially we're down to three options 'log', 'simple', and 'dtrace'.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


