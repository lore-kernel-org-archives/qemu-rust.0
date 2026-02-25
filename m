Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DE3EFD205
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 08:01:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vv9pl-0004Xc-Uy; Wed, 25 Feb 2026 03:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vv9pj-0004VH-HN
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 03:01:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vv9ph-0000YK-0L
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 03:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772006479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fRQC/kwm9DBuuNV/g4K3AOseywUiLMUbpUq1B/QnJw=;
 b=QHRM4M2yjLPLpDEfHTTgD+xcwSx6Arvpn2N9ipFAdOpd04guZSGuPpJLmfiUROO/bk3lhB
 JCDasYHRb5wH6muc0FsqB8S3CeDxpDBJ/6eSkctml6Q/AxtXvA0uELiI2HRV8LGzDqh6qz
 YgCe430Lc1c4b2rIKEGC0Hy9RXmAUrE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-BZS1IyvFP0inZ-O6M3uaCg-1; Wed, 25 Feb 2026 03:01:18 -0500
X-MC-Unique: BZS1IyvFP0inZ-O6M3uaCg-1
X-Mimecast-MFC-AGG-ID: BZS1IyvFP0inZ-O6M3uaCg_1772006477
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-483786a09b1so64061745e9.3
 for <qemu-rust@nongnu.org>; Wed, 25 Feb 2026 00:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772006477; x=1772611277;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fRQC/kwm9DBuuNV/g4K3AOseywUiLMUbpUq1B/QnJw=;
 b=uqgoOoe8zKkg18qNMBHPuXSTZ2zW8vG5up2d+w5ZcAho6kU3xQXOy/hhe3qY5UZ/h9
 arxXcKvOzeVcJZFjByoeQvR03dIdwjFVh4N+9FJbyzWR+kK0t7DfTZTtIFjPp71Ekh7H
 kif6iK4heBaJ1djnfut9qpt93qeVnJ8nOZQ3keUUeFOlU1VuAleoG79ISS1YRBRgmDNO
 iBrZSmah55QZ1Ng/m3x+i2jCvE0GrfDz3K30YSxvij8MKYuxoFJDPlH+91ku0uOlDQEs
 obTlorGJUXWlhHGs7TS3mk6tkdylRsZO/A9P9zdJw6ezJ4VlIauslBrhojATCHpDl9g9
 mYCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPTapp/6+I6jrnMnKoAGUoJC6aBam7aLg1Q7UDjNHdhyN9CRGlDvHMOCPmUlD6dNQpWMpLU3jU4eU=@nongnu.org
X-Gm-Message-State: AOJu0YyLbHm1ZOiH9BMh0ghmpSSYgX31b0pJ3Mn37FzCivJc2u2KOFKi
 jnoiDv4PFHIHYuLtO5XYiXaxHhJz8puNHhUnAV0IuBf41Tm45pzcRA2KLRwKcmAxvx85BR98gYp
 qP3rxnOj/PdcD20LbqCZ3k7xGHNu/pfjZvp9snvZd8fxDx8O7qauAx50=
X-Gm-Gg: ATEYQzxgNxhtkc368VlbKoCdwPKGyVH/i9+ja38nYWfbk1U0INrN/tKN8C5nC94eVGh
 8pNnUODPofE2tdryU0dE5TX7R6Lw/vgwE2MFOPJf36A+yH+2qcJFQrq95n9VC437vHOhEVKso27
 5QbqO6PdK/P4NDD+PtK3eKWNrGOd9gTtY2ypxh08PDo+lDb2gCuXjTklskxi867l7iNDBOkTQ2v
 mTEPWM4N6FeFiWYA2oaZ52BeQZ2brS3gRspMDHxgltGZJ2ZqVhvANDKvZ35T6f8SQDzlfiJZ0JO
 2ZZXLr5vjOo6L4DUYyvFLOrn9aMj0NXWJkvf/EcALxiolNOjvMTqOACjMcpnK1spWKFfHYOMp/Z
 R6skq2xIIlMFt0ouDco3/8Trq7in7N6AECaLwLkcNEo6xDBmL/p20DQpELIrKgwgKR7T76RTfBO
 DGfWCNu3O0jOjREgRKGZOgbNgd/+g=
X-Received: by 2002:a05:600c:8b44:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-483a95bebd8mr220916715e9.8.1772006477109; 
 Wed, 25 Feb 2026 00:01:17 -0800 (PST)
X-Received: by 2002:a05:600c:8b44:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-483a95bebd8mr220916285e9.8.1772006476616; 
 Wed, 25 Feb 2026 00:01:16 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-483bfb29715sm14429015e9.0.2026.02.25.00.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 00:01:15 -0800 (PST)
Message-ID: <21b5e0ec-d03d-4e39-a3bf-deada48243b7@redhat.com>
Date: Wed, 25 Feb 2026 09:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] scripts/qapi: add QAPISchemaType.is_predefined
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-11-pbonzini@redhat.com> <87bjhdxooi.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87bjhdxooi.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OKSty6g1wJY0J16EaSPHDBCwBz_d0P1e0O68kGMqe1U_1772006477
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/25/26 08:33, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> It is impossible to call is_implicit on an enum type from the visitor, because
>> the QAPISchemaEnumType has already been exploded into its costituent fields.
> 
> constituent
> 
> Passing selected attributes instead of the entire object to its visitor
> method limits what the visitor can do.  This is both good and bad.
> We've run into "bad" a couple of times.  It's never been bad enough to
> change the interface, though.
> 
> Thoughts?

I think that applies here, is_predefined() is a reasonable addition.

>> The Rust backend is also not modular (yet?) so it is not possible to filter
>> out the builtin module;
> 
> Really?
> 
> The visitors are all based on QAPISchemaVisitor.  Protocol:
> 
>      .visit_begin()
>      for all modules:
>          .visit_module()
>          for all entities:
>              if .visit_needed():
>                  .visit_FOO()
>      .visit_end()
> 
> QAPISchemaModularCVisitor implements .visit_module() to generate code
> per module.  Its .write() skips builtin modules unless opt_builtins.

... because its .write() already builds multiple QAPIGen{C,H,Trace}, one 
per module.  Here instead there is just one QAPIGenRs.

Using multiple QAPIGenRs instances, one per module, would be hackish. 
I'd rather just go modular instead of that.  I can take a look, since 
this series will be (early) 11.1 material anyway.

Paolo

> QAPISchemaMonolithicCVisitor is oblivious of modules: it doesn't
> implement .visit_module(), and writes out everything.  This is fine,
> because we use it only to generate qapi-features.[ch] and
> qapi-introspect.[ch].  Generating the former has no need for recognizing
> the built-ins because there are no built-in features.  Generating the
> latter has no need because it treats built-in stuff exactly like
> user-defined stuff.
> 
> QAPISchemaRsVisitor [PATCH 12] also doesn't implement .visit_module().
> It uses QAPISchema.is_predefined(), defined in this patch, to skip
> built-in.  Could it rely on .visit_module() instead?
> 
>>                          add a way to query for implicit type names without
>> having the object itself.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   scripts/qapi/schema.py | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> index 848a7401251..15f5d97418f 100644
>> --- a/scripts/qapi/schema.py
>> +++ b/scripts/qapi/schema.py
>> @@ -1243,6 +1243,17 @@ def _def_builtin_type(
>>           # schema.
>>           self._make_array_type(name, None)
>>   
>> +    def is_predefined(self, name: str) -> bool:
>> +        # See QAPISchema._def_predefineds()
>> +        entity = self._entity_dict[name]
>> +        if isinstance(entity, QAPISchemaBuiltinType):
>> +            return True
>> +        if entity is self.the_empty_object_type:
>> +            return True
>> +        if name == 'QType':
>> +            return True
>> +        return False
>> +
>>       def _def_predefineds(self) -> None:
>>           for t in [('str',    'string',  'char' + POINTER_SUFFIX),
>>                     ('number', 'number',  'double'),
> 
> 
> 


