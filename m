Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPJHH-000867-9L
	for mharc-qemu-rust@gnu.org; Wed, 11 Jun 2025 07:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPJHG-00085q-DL
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 07:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPJHE-00054D-Qq
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 07:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749639950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aF7LWn17pkhhg22fNCmAQAxb3U/YTglkfbLytrggQjk=;
 b=H/jPN68yg/BBemm3YfHyObHSoYD/UhQrZws1kAtyJKOVwS33XhBRal3fGK2fumaI70xUGg
 xRgIBYCE1tWgzaInsgbyDCurkLDkoqyYssjaca1UmW7F/ZXSZf0Mww7RIFQe8mlsndtQTG
 gkX3JOgWUPcxz/dikHYbBgLvGM5jQmc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-qAouABJ0MNGe9CGf69Ktsw-1; Wed, 11 Jun 2025 07:05:49 -0400
X-MC-Unique: qAouABJ0MNGe9CGf69Ktsw-1
X-Mimecast-MFC-AGG-ID: qAouABJ0MNGe9CGf69Ktsw_1749639948
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-441c122fa56so34105025e9.2
 for <qemu-rust@nongnu.org>; Wed, 11 Jun 2025 04:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749639948; x=1750244748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aF7LWn17pkhhg22fNCmAQAxb3U/YTglkfbLytrggQjk=;
 b=EEnkHsdQu+oExEXbkWeoJLjJKuHbhTbfMGensxmSwcA7QfAtmKK/xTVWZnfafy24yk
 qAgHznnRhtFZqt9Al1hQrvyo51sL82IU6lqc6U9WVoPlQr42Y8e0OXpjR+MGK9cZzReN
 rgj/a77xQqU6zmdkgY51bdUT/l60CGEOXvDdPtqjx24vufz8aCnLVlWKUBPZ3LyhaWNj
 q8T9ASozPv3+x36EXHHOJ5qbhmxJtycum8qcydIxbm6W2NDaZHP+5OUVsiKU90dOkFwi
 SIpSXo6gwNS3qXhhdE3dcNiybjlvZ5Yed/qFH7G60zNGkEPQ/tHThPAXiN5BschT3dkb
 gqxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyWbp9xgJD5246s32IOFZXY7FZQ+EorQSmNSP1NCrz49x/J7VSN26BLqxvUNVBslIcf6TO9tXc2Nc=@nongnu.org
X-Gm-Message-State: AOJu0YykhFqZc5Ihn61PY5k9lZ99Fffs36JoY6fUtzL/M9Hketcc3btX
 A4tkKVj/aNFyEtvtzD158CC+jcnd4CRBb+i2RxTkVZwBFw8XycwLFN6GyrO7U2+3s0ChlrYFiwT
 csOizPKjfs5ybLDN9YCOCNff56FO5rZOQsjn+JCc7k9X6ugqzYU2uNjMV3rq+S2IqyQVQdgVtlk
 qzbvkUelv0h1IaAmQTGdZUeDc1psJmCQ==
X-Gm-Gg: ASbGnctfhXgzS0mwr10T1UI6lMuXG2DL8cThjFEBerhPyuojiUZwmwmRLDS6TQp+NE6
 SWD8sUHUSDXs7M9QLA5dJLQuXsCymsRQmzV/cdEY0+86Eek4NWzdgyS8Q0qsm9YzQMDKcimNTsv
 87Lg==
X-Received: by 2002:a05:6000:2301:b0:3a5:42:b17b with SMTP id
 ffacd0b85a97d-3a5586cac26mr2035175f8f.29.1749639948392; 
 Wed, 11 Jun 2025 04:05:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqo/U5r7IN+KQsjwCtgoOdkY5TI/BNjAE9vGFM4UAA6LPlNIgj0XiGaASxFbBAWGx0yHGQda4X/5DGZQtrwqw=
X-Received: by 2002:a05:6000:2301:b0:3a5:42:b17b with SMTP id
 ffacd0b85a97d-3a5586cac26mr2035153f8f.29.1749639948099; Wed, 11 Jun 2025
 04:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250610202110.2243-1-shentey@gmail.com>
 <20250610202110.2243-2-shentey@gmail.com>
 <CAAjaMXbtcyB3J3AvGh8ZW3MSi41uMaE+TkZwipCs5pg6wvYJ=w@mail.gmail.com>
In-Reply-To: <CAAjaMXbtcyB3J3AvGh8ZW3MSi41uMaE+TkZwipCs5pg6wvYJ=w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Jun 2025 13:05:35 +0200
X-Gm-Features: AX0GCFtBBKwf6_WTw-AJEPOpstVJA4JtOOxuTIxppkBOv4rxO49_WvdS7Lv5c60
Message-ID: <CABgObfYgoYBJmZjin_Wj8JeEviFMM+vFa_QX_8Np+1n9apq4kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust/qemu-api: Add initial logging support based
 on C API
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M3vF0gSLdXbKw0xxyE0yffn5e9FIoNkvFGt2xGVH01Q_1749639948
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Jun 2025 11:05:54 -0000

On Wed, Jun 11, 2025 at 12:57=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:

> Maybe we could take this chance to remove the requirement for trailing
> newline? Not urgent, and also something we could change afterwards
> anyway. We could also introduce log_mask_ln! macro but now I'm just
> bikeshedding.

Good idea; there is no "formatln!" but I think you could use concat instead=
.

If that doesn't work for whatever reason we can indeed add it later. I
had the idea of a struct that wraps the logging functions
qemu_log_trylock() and qemu_log_unlock() and implements io::Write; at
which point, implementing log_mask_ln! (or _nl! following the unstable
format_args_nl!) with writeln! would be trivial.

> Besides that, I think it'd be useful to have the macro re-exported in
> rust/qemu-api/src/prelude.rs as well. Please add it for the next
> version.

Yes, I agree.

Paolo


