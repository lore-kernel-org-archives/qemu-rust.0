Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tBAoU-0005kH-Em
	for mharc-qemu-rust@gnu.org; Wed, 13 Nov 2024 05:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBAoT-0005jc-2K
 for qemu-rust@nongnu.org; Wed, 13 Nov 2024 05:41:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBAoR-00043V-Mk
 for qemu-rust@nongnu.org; Wed, 13 Nov 2024 05:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731494487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hc59rYI/xSj7t6kbwTR4B7hyVJRMDpac3lzSfGH1LsQ=;
 b=QR5FpSuNv0mYds58FKJWw6UTu4yjJsnk7KGLxJIIXY0O0g2ABk9ZV9p6ekCKtY2DMHAtEj
 +bnok9A3yTZK3AqhAlALPyIRCEJGkPWxfQVI4nkjgJQQrigMAX/b7Nd29KQf93BJ9xUtJZ
 LGnG5DMwY53u5WR8EZ38BY4JQA1ZxS0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-GMYnqG4OMTiJBlhdfo5WGw-1; Wed, 13 Nov 2024 05:41:24 -0500
X-MC-Unique: GMYnqG4OMTiJBlhdfo5WGw-1
X-Mimecast-MFC-AGG-ID: GMYnqG4OMTiJBlhdfo5WGw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4315e8e9b1cso3616365e9.1
 for <qemu-rust@nongnu.org>; Wed, 13 Nov 2024 02:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731494483; x=1732099283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hc59rYI/xSj7t6kbwTR4B7hyVJRMDpac3lzSfGH1LsQ=;
 b=RQC5+T6lbOfpFrKdmHlxrO1OjylBk+Cqgd+IlkkFxcWorWtuaQCk0/GPBkhC7Wuijp
 APDhrYpoO2oiFcH+U2K9YNDg5tgwzb4eIomksW4RGlpABrzJyHSP6K358IT0lqr4mE3u
 r3bvovpsmAxvNf5DdvEqtgOLmGB+FlHXRsh9jC8vTXl8c6hPJf3o8bKlFBV/7qdhUxwn
 af2nZOXwvV+GTsabF7dR+IRoA4hihud/C4X6fN3TB8pzyX2RMS3m+tLe00y8onqM/LQ5
 7PrcQrYVN+f1waWp2ZBAUwolLFjJy3mtsRy1gsu/1z4pBNFuGK/187HchnpuFmNakQeJ
 hoNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz4TrNVVOnK6U8mpClX1T/seutkSfNEM566+1FUjkiArdjgr5bRxrSbqbM0fEfsirPk2d8dDU9Vcc=@nongnu.org
X-Gm-Message-State: AOJu0YxRwkSpwI1voeDL8iQZU09qfGz2BcVMYaLIqUTTTBe29j1IY8M7
 gRazZNrQ+9QJ79NEczplDJHc0Ill89O4K0scdLI2pSZED/bgfG5dsgaVpivJ0lUbKx7QgpEJ37E
 UZhPIzEOq0xdosfHw2XJgMLcj3doVoi+wEefo8hDr9SrGfwbwQSWJr50EH/nub7KVcLzz0dKPeh
 UVDKZHyPyvkGhfA69SVx9cZ7CBHA==
X-Received: by 2002:a05:600c:1c10:b0:42c:b166:913 with SMTP id
 5b1f17b1804b1-432b74c112amr173840655e9.11.1731494483710; 
 Wed, 13 Nov 2024 02:41:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgzh/brct2L75BkWs2sABrBEz8jz93+16RxsagehyHvTUUSzWaZ0WVSWnBludkk+oR6qvnb+1IFmKq9DjLMO8=
X-Received: by 2002:a05:600c:1c10:b0:42c:b166:913 with SMTP id
 5b1f17b1804b1-432b74c112amr173840455e9.11.1731494483411; Wed, 13 Nov 2024
 02:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20241108180139.117112-1-pbonzini@redhat.com>
 <20241108180139.117112-2-pbonzini@redhat.com>
 <SY0P300MB102699E99096F482F06296EF95592@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
 <CABgObfb9ujpoRrNUUqyiAefSfTOWSV-SGmo2YrSoMdfxBeAD9A@mail.gmail.com>
 <SY0P300MB10263A5B33FAAEDCB04CDCD295592@SY0P300MB1026.AUSP300.PROD.OUTLOOK.COM>
 <6e1fce37-4a22-4f36-9798-a424e4ba43d4@redhat.com>
 <ME0P300MB10400DF22DE6A86AA4E121BE955A2@ME0P300MB1040.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <ME0P300MB10400DF22DE6A86AA4E121BE955A2@ME0P300MB1040.AUSP300.PROD.OUTLOOK.COM>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Nov 2024 11:41:12 +0100
Message-ID: <CABgObfa_Azg87Ye_tYp2-G9Nah4U6S52HKSVTw65X_hzbo08xw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] rust: qemu_api: do not disable lints outside
 bindgen-generated code
To: Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>, "Wolf,
 Kevin" <kwolf@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: octqXzmvJjxvWLmJc4aRmPS3csmYQabMmlbr5Lzkzzc_1731494484
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
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
X-List-Received-Date: Wed, 13 Nov 2024 10:41:29 -0000

On Wed, Nov 13, 2024 at 7:52=E2=80=AFAM Junjie Mao <junjie.mao@hotmail.com>=
 wrote:
> > A symbolic link seems to work too.  Thanks for the tip!
>
> Linux-based hosts should be fine. Should we test if symlinks also work
> on W32/W64 systems?

We already use symlinks for scripts/symlink-install-tree.py, fortunately.

Paolo


